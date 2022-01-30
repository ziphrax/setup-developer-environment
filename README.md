# Setup Developer Environment

This is a basic script to setup a basic environment on Ubuntu for node + typescript software development.

Included Applications:

- curl
- git
- VS Code + Extensions
- Node
- TypeScript
- kubectl
- Rancher Desktop

## Compatibility

Tested on Lenovo Ideapad 530S
Running Ubuntu 20.04 LTS

## Instructions

1. Download archive 
2. Extract archive
3. chmod +x ./init.sh
4. run ./init.sh
5. run rancher-desktop
    - This step needs to be run to pick version of k8s to use and configure containerd vs dockerd

## Additional Scripts
1. install-brew.sh
    - installs brew which is useful for installing other things
2. install-nerdfont.sh
    - a font usefull for developers and includes special symbols. mostly for use with oh my posh
3. install-oh-my-posh.sh
    - customize the cli interface

## TODO

1. install nerdctl instead of kubectl?
2. fix start rancher-desktop
3. refactor existing script
4. additional scripts for cloning and initializing projects