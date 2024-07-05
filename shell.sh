#!/bin/bash

# Function to display the menu
display_menu() {
    clear
    echo "Choose applications to install (e.g., 1 3 5):"
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
    echo "15. Gparted"
    echo "16. Ventory"
    echo "17. Slack"
    echo "18. Helm"
    echo "19. Postman"
    echo "20. PyCharm Community"
    echo "21. Boot Repair"
    echo "22. libtesseract-dev"
    echo "23. Install All Applications"
    echo "0. Exit"
}

# Function to install Google Chrome
install_google_chrome() {
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt install snapd -y
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
    sudo sed -i 's/^deb http:\/\/br.archive.ubuntu.com/deb http:\/\/archive.ubuntu.com/g' /etc/apt/sources.list
    wget -O /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt-get install -y /tmp/google-chrome-stable_current_amd64.deb
}

# Function to install Docker
install_docker() {
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo apt install docker-compose -y
    sudo usermod -aG docker $USER
}

# Function to install Kind and kubectl
install_kubernetes_tools() {
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/
}

# Function to install HashiCorp tools (Terraform)
install_terraform() {
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt-get update
    sudo apt-get install -y terraform
}

# Function to install Iriun Webcam
install_iriun_webcam() {
    wget -O /tmp/iriunwebcam-2.8.deb https://iriun.gitlab.io/iriunwebcam-2.8.deb
    sudo apt-get install -y /tmp/iriunwebcam-2.8.deb
}

# Function to install DBeaver CE
install_dbeaver_ce() {
    sudo snap install dbeaver-ce --classic
}

# Function to install Visual Studio Code
install_visual_studio_code() {
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-archive-keyring.gpg > /dev/null
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
    sudo apt-get update
    sudo apt-get install -y code
}

# Function to install AWS CLI and AWS Sam CLI
install_aws_cli_and_sam_cli() {
    wget -O /tmp/awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
    unzip -q /tmp/awscliv2.zip -d /tmp
    sudo /tmp/aws/install --update
    wget -O /tmp/aws-sam-cli-linux-x86_64.zip https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
    unzip -q /tmp/aws-sam-cli-linux-x86_64.zip -d sam-installation
    sudo ./sam-installation/install
}

# Function to install Python venv and pip
install_python_venv() {
    sudo apt-get install -y python3-venv
    sudo apt-get install -y python3-pip
}

# Function to install Git
install_git() {
    sudo apt-get install -y git
}

# Function to install Ansible
install_ansible() {
    sudo apt-get install ansible -y
}

# Function to install Kustomize
install_kustomize() {
    sudo snap install kustomize
}

# Function to install Telegram Desktop
install_telegram_desktop() {
    sudo snap install telegram-desktop
}

# Function to install VLC
install_vlc() {
    sudo apt-get install vlc -y
}

# Function to install Gparted
install_gparted() {
    sudo apt-get install gparted -y
}

# Function to install PyCharm Community
install_pycharm_community() {
    sudo snap install pycharm-community --classic
}

# Function to install Boot Repair
install_boot_repair() {
    sudo add-apt-repository ppa:yannubuntu/boot-repair && sudo apt update
    sudo apt install -y boot-repair && boot-repair
}

# Function to install libtesseract-dev
install_libtesseract() {
    sudo apt install libtesseract-dev -y
}

# Function to install Ventory
install_ventory() {
    wget https://github.com/ventoy/Ventoy/releases/download/v1.0.97/ventoy-1.0.97-linux.tar.gz
    tar xzf ventoy-1.0.97-linux.tar.gz
}

# Function to install Slack
install_slack() {
    sudo snap install slack --classic
}

# Function to install Helm
install_helm() {
    sudo snap install helm --classic
}

# Function to install Postman
install_postman() {
    sudo snap install postman
    sudo apt-get update && sudo apt-get upgrade -y
    sudo reboot
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
    install_gparted
    install_pycharm_community
    install_boot_repair
    install_libtesseract
    install_ventory
    install_slack
    install_helm
    install_postman
}

# Main script
while true; do
    display_menu
    read -p "Enter your choices (e.g., 1 3 5) or 0 to exit: " -a choices

    for choice in "${choices[@]}"; do
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
            15) install_gparted ;;
            16) install_ventory ;;
            17) install_slack ;;
             18) install_helm ;;
            19) install_postman ;;
            20) install_pycharm_community ;;
            21) install_boot_repair ;;
            22) install_libtesseract ;;
            23) install_all_applications ;;
            0) exit ;;
            *) echo "Invalid choice: $choice. Skipping..." ;;
        esac
    done

    read -p "Press Enter to continue..."
done
