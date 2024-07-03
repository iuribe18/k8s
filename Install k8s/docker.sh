#!/bin/bash
# Install Docker
# SO: Ubutnu
# Autor: Ivan Uribe Gonzalez
# Usage: ./docker.sh

## Step 0 - Uninstall old versions
# Older versions of Docker went by the names of docker, docker.io, or docker-engine. Uninstall any such older versions before attempting to install a new version:
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

## Step 1 - Set up the repository
# First, Set up the repository
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

## Step 2 - Install the Docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

## Step 3 - Verify that the Docker Engine installation is successful by running the hello-world image
sudo docker run hello-world

# If you need to add a user to the docker group that you�re not logged in as, declare that username explicitly using:
sudo groupadd docker
sudo usermod -aG docker $USER


## Uninstall Docker Engine
# Uninstall the Docker Engine, CLI, containerd, and Docker Compose packages:
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
# Images, containers, volumes, or custom configuration files on your host aren't automatically removed. To delete all images, containers, and volumes:
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd