#!/bin/bash
# Install kubectl Ubuntu 22.04
# Date: 2024-06-12
# Autor: Ivan Uribe Gonzalez
# Usage: ./kubectl.sh
# References: Install and Set Up kubectl on Linux
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management

## Install using native package management
# 1. Update the apt package index and install packages needed to use the Kubernetes apt repository
sudo apt-get update
# apt-transport-https may be a dummy package; if so, you can skip that package
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

# 2. Download the public signing key for the Kubernetes package repositories. 
# The same signing key is used for all repositories so you can disregard the version in the URL
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring

# 3. Add the appropriate Kubernetes apt repository. If you want to use Kubernetes version different than v1.30, replace v1.30 with the desired minor version in the command below:
# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list   # helps tools such as command-not-found to work correctly

# 4. Update apt package index, then install kubectl:
sudo apt-get update
sudo apt-get install -y kubectl