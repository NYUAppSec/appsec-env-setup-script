#!/usr/bin/env bash
set -ex 

# Docker installation from https://docs.docker.com/desktop/install/mac-install/

brew install docker
brew install docker-compose
sudo dockerd

docker run hello-world


# Kubectl installation from https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"

# Validate binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl.sha256"   

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl
sudo chown root: /usr/local/bin/kubectl

kubectl version --client

rm kubectl.sha256

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
sudo install minikube-darwin-amd64 /usr/local/bin/minikube

echo "Setup for HW3 complete, you can now continue with Part 1.1"