#!/bin/bash

#gitclone
#sam cli
#teamviwer
#kustomizer
#Ansible
#Docker Compose

# Install required dependencies
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Change Ubuntu package repository
sudo sed -i 's/^deb http:\/\/br.archive.ubuntu.com/deb http:\/\/archive.ubuntu.com/g' /etc/apt/sources.list

# Download Google Chrome package
wget -O /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install Google Chrome
sudo apt-get install -y /tmp/google-chrome-stable_current_amd64.deb

# Install Docker dependencies
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list

# Install Docker packages
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

# Add user to docker group
sudo usermod -aG docker w3ll1n9t0n

# Install Kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Download and configure HashiCorp GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add HashiCorp repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Install Terraform
sudo apt-get update
sudo apt-get install -y terraform

# Download Iriun Webcam package
wget -O /tmp/iriunwebcam-2.8.deb https://iriun.gitlab.io/iriunwebcam-2.8.deb

# Install Iriun Webcam package
sudo apt-get install -y /tmp/iriunwebcam-2.8.deb

# Install DBeaver CE
sudo snap install dbeaver-ce --classic

# Import Microsoft GPG key
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-archive-keyring.gpg > /dev/null

# Add Visual Studio Code repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# Install Visual Studio Code
sudo apt-get update
sudo apt-get install -y code

# Install python3-pip package
sudo apt-get install -y python3-pip

# Download AWS CLI package
wget -O /tmp/awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip

# Unarchive AWS CLI package
unzip -q /tmp/awscliv2.zip -d /tmp

# Install AWS CLI
sudo /tmp/aws/install --update

# Install Python venv
sudo apt-get install -y python3-venv

# Install Git
sudo apt-get install -y git

# Install software telegram using snap
sudo snap install telegram-desktop

# Install software vlc using snap
sudo snap install vlc

# Update package cache
sudo apt-get update
