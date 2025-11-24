#!/bin/bash

# Enhanced System Update and Application Installer
# Version: 2.0
# Author: Enhanced by AI Assistant

# Colors for better UI
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Logging function
log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

error() {
    echo -e "${RED}[ERROR] $1${NC}"
}

warning() {
    echo -e "${YELLOW}[WARNING] $1${NC}"
}

# System update function
system_update() {
    log "Updating system packages..."
    sudo apt update && sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt autoclean
}



# Main menu display
display_main_menu() {
    clear
    echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║                    SYSTEM INSTALLER v2.0                    ║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BLUE}Choose a category:${NC}"
    echo -e "${YELLOW}1.${NC} Development Tools"
    echo -e "${YELLOW}2.${NC} DevOps & Cloud Tools"
    echo -e "${YELLOW}3.${NC} Media & Communication"
    echo -e "${YELLOW}4.${NC} System Utilities"
    echo -e "${YELLOW}5.${NC} System Maintenance"
    echo -e "${YELLOW}0.${NC} Exit"
    echo ""
}

# Development Tools Menu
display_dev_menu() {
    clear
    echo -e "${PURPLE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║                    DEVELOPMENT TOOLS                        ║${NC}"
    echo -e "${PURPLE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BLUE}Select tools to install (e.g., 1 3 5):${NC}"
    echo -e "${YELLOW}1.${NC}  Visual Studio Code"
    echo -e "${YELLOW}2.${NC}  Git + Git LFS"
    echo -e "${YELLOW}3.${NC}  Python (venv, pip, dev tools)"
    echo -e "${YELLOW}4.${NC}  Node.js & npm"
    echo -e "${YELLOW}5.${NC}  DBeaver CE (Database Tool)"
    echo -e "${YELLOW}6.${NC}  Postman (API Testing)"
    echo -e "${YELLOW}7.${NC}  Insomnia (API Client)"
    echo -e "${YELLOW}8.${NC}  libtesseract-dev (OCR)"
    echo -e "${YELLOW}0.${NC}  Back to main menu"
    echo ""
}

# DevOps & Cloud Tools Menu
display_devops_menu() {
    clear
    echo -e "${PURPLE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║                   DEVOPS & CLOUD TOOLS                      ║${NC}"
    echo -e "${PURPLE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BLUE}Select tools to install (e.g., 1 3 5):${NC}"
    echo -e "${YELLOW}1.${NC}  Docker & Docker Compose"
    echo -e "${YELLOW}2.${NC}  Kubernetes (kubectl)"
    echo -e "${YELLOW}3.${NC}  Eksctl - AWS"
    echo -e "${YELLOW}4.${NC}  Terraform (Infrastructure as Code)"
    echo -e "${YELLOW}5.${NC}  Ansible (Configuration Management)"
    echo -e "${YELLOW}6.${NC}  AWS CLI & SAM CLI"
    echo -e "${YELLOW}7.${NC}  Kustomize"
    echo -e "${YELLOW}8.${NC}  Kind"
    echo -e "${YELLOW}9.${NC}  Kiro CLI"
    echo -e "${YELLOW}0.${NC}  Back to main menu"
    echo ""
}

# Media & Communication Menu
display_media_menu() {
    clear
    echo -e "${PURPLE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║                 MEDIA & COMMUNICATION                       ║${NC}"
    echo -e "${PURPLE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BLUE}Select applications to install (e.g., 1 3 5):${NC}"
    echo -e "${YELLOW}1.${NC}  Google Chrome"
    echo -e "${YELLOW}2.${NC}  VLC Media Player"
    echo -e "${YELLOW}3.${NC}  Telegram Desktop"
    echo -e "${YELLOW}4.${NC}  Slack"
    echo -e "${YELLOW}5.${NC}  Zoom"
    echo -e "${YELLOW}6.${NC}  OBS Studio"
    echo -e "${YELLOW}7.${NC}  Iriun Webcam"
    echo -e "${YELLOW}0.${NC}  Back to main menu"
    echo ""
}

# System Utilities Menu
display_system_menu() {
    clear
    echo -e "${PURPLE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║                    SYSTEM UTILITIES                         ║${NC}"
    echo -e "${PURPLE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BLUE}Select utilities to install (e.g., 1 3 5):${NC}"
    echo -e "${YELLOW}1.${NC}  GParted (Partition Manager)"
    echo -e "${YELLOW}2.${NC}  Ventoy (Bootable USB Tool)"
    echo -e "${YELLOW}3.${NC}  Boot Repair"
    echo -e "${YELLOW}4.${NC}  TestDisk (Data Recovery)"
    echo -e "${YELLOW}5.${NC}  Htop (System Monitor)"
    echo -e "${YELLOW}6.${NC}  Neofetch (System Info)"
    echo -e "${YELLOW}7.${NC}  Tree (Directory Structure)"
    echo -e "${YELLOW}8.${NC}  Curl & Wget"
    echo -e "${YELLOW}9.${NC}  Net-tools"
    echo -e "${YELLOW}10.${NC} Inxi (System Information)"
    echo -e "${YELLOW}11.${NC} Timeshift (System Backup)"
    echo -e "${YELLOW}0.${NC}  Back to main menu"
    echo ""
}

# System Maintenance Menu
display_maintenance_menu() {
    clear
    echo -e "${PURPLE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║                   SYSTEM MAINTENANCE                        ║${NC}"
    echo -e "${PURPLE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BLUE}Select maintenance tasks:${NC}"
    echo -e "${YELLOW}1.${NC}  System Update & Upgrade"
    echo -e "${YELLOW}2.${NC}  Clean Package Cache"
    echo -e "${YELLOW}3.${NC}  Remove Orphaned Packages"
    echo -e "${YELLOW}4.${NC}  Fix Broken Dependencies"
    echo -e "${YELLOW}5.${NC}  Full System Cleanup"
    echo -e "${YELLOW}0.${NC}  Back to main menu"
    echo ""
}

# Installation Functions

# Development Tools
install_vscode() {
    log "Installing Visual Studio Code..."
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
    sudo apt update && sudo apt install -y code
}

install_git_enhanced() {
    log "Installing Git and Git LFS..."
    sudo apt install -y git git-lfs
    git lfs install
}

install_python_dev() {
    log "Installing Python development tools..."
    sudo apt install -y python3 python3-pip python3-venv python3-dev build-essential
}

install_nodejs() {
    log "Installing Node.js and npm..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install -y nodejs
}

install_go() {
    log "Installing Go Programming Language..."
    wget -O /tmp/go.tar.gz https://go.dev/dl/go1.21.5.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf /tmp/go.tar.gz
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
}

install_rust() {
    log "Installing Rust Programming Language..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source ~/.cargo/env
}

install_dbeaver() {
    log "Installing DBeaver CE..."
    wget -O /tmp/dbeaver-ce_latest_amd64.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
    sudo apt install -y /tmp/dbeaver-ce_latest_amd64.deb
}

install_postman() {
    log "Installing Postman..."
    wget -O /tmp/postman.tar.gz https://dl.pstmn.io/download/latest/linux64
    sudo tar -xzf /tmp/postman.tar.gz -C /opt
    sudo ln -sf /opt/Postman/Postman /usr/local/bin/postman
}

install_insomnia() {
    log "Installing Insomnia..."
    wget -O /tmp/insomnia.deb https://updates.insomnia.rest/downloads/ubuntu/latest
    sudo apt install -y /tmp/insomnia.deb
}

install_tesseract() {
    log "Installing Tesseract OCR..."
    sudo apt install -y libtesseract-dev tesseract-ocr
}

# DevOps Tools
install_docker_enhanced() {
    log "Installing Docker and Docker Compose..."
    sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
    sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo usermod -aG docker $USER
}

install_kubernetes() {
    log "Installing Kubernetes tools..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl && sudo mv kubectl /usr/local/bin/
}

install_terraform() {
    log "Installing Terraform..."
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install -y terraform
}

install_ansible() {
    log "Installing Ansible..."
    sudo apt install -y ansible
}

install_aws_cli() {
    log "Installing AWS CLI and SAM CLI..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip && sudo ./aws/install --update
    rm -rf aws awscliv2.zip
}

install_kustomize() {
    log "Installing Kustomize..."
    curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
    sudo mv kustomize /usr/local/bin/
}

install_kind() {
    log "Installing Kind..."
    # For AMD64 / x86_64
    [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64
    # For ARM64
    [ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-arm64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind
}

install_kiro() {
    log "Installing Kiro CLI..."
    curl -fsSL https://cli.kiro.dev/install | bash
}

install_eksctl() {
    log "Installing eksctl..."
    # for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
    ARCH=amd64
    PLATFORM=$(uname -s)_$ARCH

    curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

    # (Optional) Verify checksum
    curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

    tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

    sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl
}

# Media & Communication
install_chrome() {
    log "Installing Google Chrome..."
    wget -O /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y /tmp/google-chrome-stable_current_amd64.deb
}

install_firefox() {
    log "Installing Firefox..."
    sudo apt install -y firefox
}

install_vlc() {
    log "Installing VLC Media Player..."
    sudo apt install -y vlc
}

install_telegram() {
    log "Installing Telegram Desktop..."
    wget -O /tmp/telegram.tar.xz https://telegram.org/dl/desktop/linux
    sudo tar -xJf /tmp/telegram.tar.xz -C /opt
    sudo ln -sf /opt/Telegram/Telegram /usr/local/bin/telegram
}

install_slack() {
    log "Installing Slack..."
    wget -O /tmp/slack.deb https://downloads.slack-edge.com/releases/linux/4.36.140/prod/x64/slack-desktop-4.36.140-amd64.deb
    sudo apt install -y /tmp/slack.deb
}

install_discord() {
    log "Installing Discord..."
    wget -O /tmp/discord.deb "https://discord.com/api/download?platform=linux&format=deb"
    sudo apt install -y /tmp/discord.deb
}

install_zoom() {
    log "Installing Zoom..."
    wget -O /tmp/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
    sudo apt install -y /tmp/zoom.deb
}

install_obs() {
    log "Installing OBS Studio..."
    sudo add-apt-repository ppa:obsproject/obs-studio -y
    sudo apt update && sudo apt install -y obs-studio
}

install_iriun() {
    log "Installing Iriun Webcam..."
    wget -O /tmp/iriunwebcam-2.8.deb https://iriun.gitlab.io/iriunwebcam-2.8.deb
    sudo apt install -y /tmp/iriunwebcam-2.8.deb
}

# System Utilities
install_gparted() {
    log "Installing GParted..."
    sudo apt install -y gparted
}

install_ventoy() {
    log "Installing Ventoy..."
    wget https://github.com/ventoy/Ventoy/releases/download/v1.0.97/ventoy-1.0.97-linux.tar.gz
    tar xzf ventoy-1.0.97-linux.tar.gz
}

install_boot_repair() {
    log "Installing Boot Repair..."
    sudo add-apt-repository ppa:yannubuntu/boot-repair -y
    sudo apt update && sudo apt install -y boot-repair
}

install_testdisk() {
    log "Installing TestDisk..."
    sudo apt install -y testdisk
}

install_htop() {
    log "Installing Htop..."
    sudo apt install -y htop
}

install_neofetch() {
    log "Installing Neofetch..."
    sudo apt install -y neofetch
}

install_tree() {
    log "Installing Tree..."
    sudo apt install -y tree
}

install_curl_wget() {
    log "Installing Curl and Wget..."
    sudo apt install -y curl wget
}

install_net_tools() {
    log "Installing Net-tools..."
    sudo apt install -y net-tools
}

install_inxi() {
    log "Installing Inxi..."
    sudo apt install -y inxi
}

install_timeshift() {
    log "Installing Timeshift..."
    sudo apt install -y timeshift
}

# Maintenance Functions
clean_cache() {
    log "Cleaning package cache..."
    sudo apt clean && sudo apt autoclean
}

remove_orphans() {
    log "Removing orphaned packages..."
    sudo apt autoremove -y
}

fix_dependencies() {
    log "Fixing broken dependencies..."
    sudo apt --fix-broken install -y
}

full_cleanup() {
    system_update
    clean_cache
    remove_orphans
    fix_dependencies
}

# Menu handlers
handle_dev_menu() {
    while true; do
        display_dev_menu
        read -p "Enter your choices (e.g., 1 3 5) or 0 to go back: " -a choices
        
        for choice in "${choices[@]}"; do
            case $choice in
                1) install_vscode ;;
                2) install_git_enhanced ;;
                3) install_python_dev ;;
                4) install_nodejs ;;
                5) install_dbeaver ;;
                6) install_postman ;;
                7) install_insomnia ;;
                8) install_tesseract ;;
                0) return ;;
                *) error "Invalid choice: $choice" ;;
            esac
        done
        
        if [[ " ${choices[@]} " =~ " 0 " ]]; then
            break
        fi
        read -p "Press Enter to continue..."
    done
}

handle_devops_menu() {
    while true; do
        display_devops_menu
        read -p "Enter your choices (e.g., 1 3 5) or 0 to go back: " -a choices
        
        for choice in "${choices[@]}"; do
            case $choice in
                1) install_docker_enhanced ;;
                2) install_kubernetes ;;
                3) install_eksctl ;;
                4) install_terraform ;;
                5) install_ansible ;;
                6) install_aws_cli ;;
                7) install_kustomize ;;
                8) install_kind ;;
                9) install_kiro ;;
                0) return ;;
                *) error "Invalid choice: $choice" ;;
            esac
        done
        
        if [[ " ${choices[@]} " =~ " 0 " ]]; then
            break
        fi
        read -p "Press Enter to continue..."
    done
}

handle_media_menu() {
    while true; do
        display_media_menu
        read -p "Enter your choices (e.g., 1 3 5) or 0 to go back: " -a choices
        
        for choice in "${choices[@]}"; do
            case $choice in
                1) install_chrome ;;
                2) install_vlc ;;
                3) install_telegram ;;
                4) install_slack ;;
                5) install_zoom ;;
                6) install_obs ;;
                7) install_iriun ;;
                0) return ;;
                *) error "Invalid choice: $choice" ;;
            esac
        done
        
        if [[ " ${choices[@]} " =~ " 0 " ]]; then
            break
        fi
        read -p "Press Enter to continue..."
    done
}

handle_system_menu() {
    while true; do
        display_system_menu
        read -p "Enter your choices (e.g., 1 3 5) or 0 to go back: " -a choices
        
        for choice in "${choices[@]}"; do
            case $choice in
                1) install_gparted ;;
                2) install_ventoy ;;
                3) install_boot_repair ;;
                4) install_testdisk ;;
                5) install_htop ;;
                6) install_neofetch ;;
                7) install_tree ;;
                8) install_curl_wget ;;
                9) install_net_tools ;;
                10) install_inxi ;;
                11) install_timeshift ;;
                0) return ;;
                *) error "Invalid choice: $choice" ;;
            esac
        done
        
        if [[ " ${choices[@]} " =~ " 0 " ]]; then
            break
        fi
        read -p "Press Enter to continue..."
    done
}

handle_maintenance_menu() {
    while true; do
        display_maintenance_menu
        read -p "Enter your choice: " choice
        
        case $choice in
            1) system_update ;;
            2) clean_cache ;;
            3) remove_orphans ;;
            4) fix_dependencies ;;
            5) full_cleanup ;;
            0) return ;;
            *) error "Invalid choice: $choice" ;;
        esac
        
        if [[ $choice == "0" ]]; then
            break
        fi
        read -p "Press Enter to continue..."
    done
}

# Main script loop
main() {
    while true; do
        display_main_menu
        read -p "Enter your choice: " choice
        
        case $choice in
            1) handle_dev_menu ;;
            2) handle_devops_menu ;;
            3) handle_media_menu ;;
            4) handle_system_menu ;;
            5) handle_maintenance_menu ;;
            0) 
                log "Exiting..."
                exit 0
                ;;
            *) 
                error "Invalid choice: $choice"
                read -p "Press Enter to continue..."
                ;;
        esac
    done
}

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    error "This script should not be run as root"
    exit 1
fi

# Start the main function
main
