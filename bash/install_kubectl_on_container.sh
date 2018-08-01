wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-210.0.0-linux-x86_64.tar.gz
tar -xvf google-cloud-sdk-210.0.0-linux-x86_64.tar.gz
rm google-cloud-sdk-210.0.0-linux-x86_64.tar.gz
bash google-cloud-sdk/install.sh -q  # q makes it non-interactive
bash google-cloud-sdk/bin/gcloud components install kubectl -q  # again is in non interactive
mkdir -p /usr/local/bin
set -x
install google-cloud-sdk/bin/kubectl /usr/local/bin
kubectl get nodes

echo "Tada!"
