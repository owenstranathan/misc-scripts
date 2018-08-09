#!/bin/bash

CLEAR='\033[0m' # resets color and format
GREEN='\033[38;5;2m'
RED='\033[38;5;1m'
MAGENTA='\033[38;5;5m'
CHECK='\xE2\x9C\x94'
CROSS='\xe2\x9c\x98'
GREEN_CHECK="${GREEN}${CHECK}${CLEAR}"
RED_CROSS="${RED}${CROSS}${CLEAR}"

readonly PROGNAME="$(basename "$0" | sed 's/.sh//g')"


function run_test(){
    local test_name
    local rc
    test_name="$1"
    shift
    output="$(eval "$test_name" "$@")"
    rc="$?"
    if [[ "$rc" -eq "0" ]]; then
        echo -e "$test_name ${GREEN_CHECK}"
        return 0
    else
        echo -e "$test_name ${RED_CROSS}"
        echo -e "${RED}$output${CLEAR}"
        return 1
    fi
}


function main() {
    if [[ $1 != "" ]]; then
        search_path="$1/test"
    else
        search_path="$PWD/test"
    fi
    local test_files
    test_files=$(find "$search_path" -mindepth 1 | grep test)
    for test_file in $test_files; do
        echo -e "${MAGENTA}$(basename "$test_file")${CLEAR}"
        source "$test_file"
        local decls
        decls=$(declare -F)
        for decl in $decls; do
            case "$decl" in 
                "test_"*)
                    run_test "$decl"
                    unset -f "$decl"
                    ;;
                *)
                    continue
                    ;;
            esac
        done
    done
}

main "$@"