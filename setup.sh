#!/usr/bin/env bash

RESTORE='\033[0m'
GREEN='\033[01;32m'

#Installing VirtualBox
echo -e "${GREEN}=> Installing VirtualBox........................${RESTORE}"
sudo apt-get install virtualbox 

echo -e ""
#Installing kubectl https://kubernetes.io/docs/getting-started-guides/kubectl/
echo -e "${GREEN}=> Installing kubectl...........................${RESTORE}"
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

echo -e ""
#Installing minikube https://github.com/kubernetes/minikube/releases
echo -e "${GREEN}=> Installing minikube..........................${RESTORE}"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube 
sudo mv minikube /usr/local/bin/

# Minikube Start
minikube start

# Check versions
echo ""
echo -e "${GREEN}=> minikube version..........................${RESTORE}"
minikube version

echo ""
echo -e "${GREEN}=> kubectl version..........................${RESTORE}"
kubectl version