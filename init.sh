#!/bin/bash

# Setup Developer Environment Script

ROOT_UID=0     # Only users with $UID 0 have root privileges
E_NOTROOT=87   # Non-root exit error.
USERS_HOME_DIR="$(getent passwd $SUDO_USER | cut -d: -f6)" 

echo "--------SETUP DEVELOPER ENVIRONMENT------"
echo

# Run as root, of course.
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi

sudo apt update
sudo apt upgrade -y

echo "Install applications:"
echo

echo "Base Dependencies - build-essentials procps curl file"
sudo apt-get install build-essential procps curl file -y

echo "GIT - Version Control"
sudo apt install git -y

echo "Node.js + npm"
sudo apt install nodejs -y
sudo apt install npm -y

echo "TypeScript"
npm install -g typescript

echo "VS Code - IDE"
sudo snap install --classic code
echo

echo "VS Code - Installing recommended extensions"
code --install-extension oderwat.indent-rainbow
code --install-extension 2gua.rainbow-brackets
code --install-extension redhat.vscode-yaml
code --install-extension vscode-icons-team.vscode-icons
code --install-extension eamodio.gitlens
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension wmaurer.change-case

echo "kubectl - k8s tool"
sudo snap install --classic kubectl

# echo "nerdctl - better k8s tool"
# echo "TODO: "

# if [ ! -d /usr/local/tools ]
# then
#   mkdir /usr/local/tools
# fi

# if [ ! -f /usr/local/tools/nerdctl.tar.gz ]
# then
#   curl https://github.com/containerd/nerdctl/releases/download/v0.16.0/nerdctl-0.16.0-linux-amd64.tar.gz --output /usr/local/tools/nerdctl.tar.gz
#   sudo tar -xvf /usr/local/tools/nerdctl.tar.gz
# fi

# if [[ ":$PATH:" != *":/usr/local/tools"* ]] 
# then
#   $PATH=$PATH:/usr/local/tools
#   echo 'export $PATH=$PATH:/usr/local/tools' >> /etc/profile
# fi


echo "Rancher Desktop - Container Orchestration"

curl https://download.opensuse.org/repositories/isv:/Rancher:/stable/deb/Release.key | sudo apt-key add -
sudo add-apt-repository 'deb https://download.opensuse.org/repositories/isv:/Rancher:/stable/deb/ ./'
sudo apt update
sudo apt install rancher-desktop -y

echo
echo "Installation Complete"
echo

read -p "Do you wish to start Rancher Desktop? You can always run this manually later with the command 'rancher-desktop' [y/n]" -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rancher-desktop
fi

echo 
echo "Don't Forget:"
echo " - You may wish to configure your git credentials and add your personal access token"
echo " - There maybe additional scripts you may wish to run for your setup"
echo 

echo "Thank you for using the setup development environment script"