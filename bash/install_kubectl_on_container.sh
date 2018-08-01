wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-210.0.0-linux-x86_64.tar.gz
tar -xf google-cloud-sdk-210.0.0-linux-x86_64.tar.gz
rm google-cloud-sdk-210.0.0-linux-x86_64.tar.gz
bash google-cloud-sdk/install.sh -q  --additional-components kubectl  # q makes it non-interactive
mkdir -p /usr/local/bin
install google-cloud-sdk/bin/kubectl /usr/local/bin

rm -rf google-cloud-sdk

