#!/bin/bash

#sudo apt-get install gparted

# Function to display the menu
display_menu() {
    clear
    echo "Choose an application to install:"
    echo "1. Google Chrome"
    echo "2. Docker"
    echo "3. Kind and kubectl"
    echo "4. HashiCorp tools (Terraform)"
    echo "5. Iriun Webcam"
    echo "6. DBeaver CE"
    echo "7. Visual Studio Code"
    echo "8. AWS CLI and AWS Sam CLI"
    echo "9. Python venv - pip"
    echo "10. Git"
    echo "11. Ansible"
    echo "12. Kustomize"
    echo "13. Telegram Desktop"
    echo "14. VLC"
    echo "15. TeamViewer"
    echo "16. Install All Applications"
    echo "0. Exit"
}

# Function to install Google Chrome
install_google_chrome() {
    
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

    sudo sed -i 's/^deb http:\/\/br.archive.ubuntu.com/deb http:\/\/archive.ubuntu.com/g' /etc/apt/sources.list

    # Download Google Chrome package
    wget -O /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    # Install Google Chrome
    sudo apt-get install -y /tmp/google-chrome-stable_current_amd64.deb
}

# Function to install Docker
install_docker() {
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

}

# Function to install Kind and kubectl
install_kubernetes_tools() {
    
    # Install Kind
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind

    # Install kubectl
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/
}

# Function to install HashiCorp tools (Terraform)
install_terraform() {
    
    # Download and configure HashiCorp GPG key
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

    # Add HashiCorp repository
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

    # Install Terraform
    sudo apt-get update
    sudo apt-get install -y terraform
}

# Function to install Iriun Webcam
install_iriun_webcam() {
    # Download Iriun Webcam package
    wget -O /tmp/iriunwebcam-2.8.deb https://iriun.gitlab.io/iriunwebcam-2.8.deb

    # Install Iriun Webcam package
    sudo apt-get install -y /tmp/iriunwebcam-2.8.deb
}

# Function to install DBeaver CE
install_dbeaver_ce() {
    # Install DBeaver CE
    sudo snap install dbeaver-ce --classic
}

# Function to install Visual Studio Code
install_visual_studio_code() {
    # Import Microsoft GPG key
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-archive-keyring.gpg > /dev/null

    # Add Visual Studio Code repository
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

    # Install Visual Studio Code
    sudo apt-get update
    sudo apt-get install -y code
}

# Function to install AWS CLI and AWS Sam CLI
install_aws_cli_and_sam_cli() {
    # Download AWS CLI package
    wget -O /tmp/awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip

    # Unarchive AWS CLI package
    unzip -q /tmp/awscliv2.zip -d /tmp

    # Install AWS CLI
    sudo /tmp/aws/install --update

    # Download Sam cli
    wget -O /tmp/aws-sam-cli-linux-x86_64.zip https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip

    # Unarchive AWS SAMCLI package
    unzip -q /tmp/aws-sam-cli-linux-x86_64.zip -d sam-installation

    # Install AWS SAMCLI
    sudo ./sam-installation/install

}

# Function to install Python venv
install_python_venv() {
    # Install Python venv
    sudo apt-get install -y python3-venv
    # Install python3-pip package
    sudo apt-get install -y python3-pip

}

# Function to install Git
install_git() {
    # Install Git
    sudo apt-get install -y git
}

# Function to install Ansible
install_ansible() {
    # Install ansible 
    sudo apt-get install ansible -y
}

# Function to install Kustomize
install_kustomize() {
    # install Kustomize
    sudo snap install kustomize
}

# Function to install Telegram Desktop
install_telegram_desktop() {
    # Install software telegram using snap
    sudo snap install telegram-desktop
}

# Function to install VLC
install_vlc() {
    # Install software vlc using snap
    sudo snap install vlc

}

# Function to install TeamViewer
install_teamviewer() {
    
    # Install teamviwer
    cd /tmp wget https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc
    sudo apt-key add TeamViewer2017.asc
    sudo sh -c 'echo "deb http://linux.teamviewer.com/deb stable main" >> /etc/apt/sources.list.d/teamviewer.list'
    sudo sh -c 'echo "deb http://linux.teamviewer.com/deb preview main" >> /etc/apt/sources.list.d/teamviewer.list'
    sudo apt update && sudo apt upgrade -y
    sudo apt install teamviewer -y
}

# Function to install all applications
install_all_applications() {
    install_google_chrome
    install_docker
    install_kubernetes_tools
    install_terraform
    install_iriun_webcam
    install_dbeaver_ce
    install_visual_studio_code
    install_aws_cli_and_sam_cli
    install_python_venv
    install_git
    install_ansible
    install_kustomize
    install_telegram_desktop
    install_vlc
    install_teamviewer
}

# Main script
while true; do
    display_menu
    read -p "Enter your choice (0 to exit): " choice

    case $choice in
        1) install_google_chrome ;;
        2) install_docker ;;
        3) install_kubernetes_tools ;;
        4) install_terraform ;;
        5) install_iriun_webcam ;;
        6) install_dbeaver_ce ;;
        7) install_visual_studio_code ;;
        8) install_aws_cli_and_sam_cli ;;
        9) install_python_venv ;;
        10) install_git ;;
        11) install_ansible ;;
        12) install_kustomize ;;
        13) install_telegram_desktop ;;
        14) install_vlc ;;
        15) install_teamviewer ;;
        16) install_all_applications ;;
        0) exit ;;
        *) echo "Invalid choice. Please enter a valid option." ;;
    esac

    read -p "Press Enter to continue..."
done


