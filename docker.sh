#!/bin/bash
# Install Docker Ubuntu 22.04
# Date: 2024-06-12
# Autor: Ivan Uribe Gonzalez
# Usage: ./docker.sh
# References: Install Docker Engine on Ubuntu
# https://docs.docker.com/engine/install/ubuntu/

## Prerequisites
# Uninstall old versions
# for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

## Install using the apt repository
# Step 1 - Set up the repository
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

## Step 2 - Install the Docker packages
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify that the Docker Engine installation is successful by running the hello-world image.
sudo docker run hello-world

## Linux post-installation steps for Docker Engine
# To create the docker group and add your user:
# Add your user to the docker group.
sudo usermod -aG docker $USER
# Log out and log back in so that your group membership is re-evaluated