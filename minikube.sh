#!/bin/bash
# Install minikube Ubuntu 22.04
# Date: 2024-06-12
# Autor: Ivan Uribe Gonzalez
# Usage: ./minikube.sh
# References: minikube start
# https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64