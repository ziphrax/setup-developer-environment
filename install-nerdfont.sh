#!/bin/bash

echo "Installing nerdfont..."
sudo wget -O /usr/local/tools/nerdfont.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip" 

sudo unzip /usr/local/tools/nerdfont.zip -d /usr/share/fonts/truetype/
fc-cache -f -v
echo "Installation Complete!"