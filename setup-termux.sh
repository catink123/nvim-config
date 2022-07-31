#!/bin/bash
echo "Welcome to Catink123's Neovim Config bootstrapper script! This script installs neccesary packages for Neovim packages to work properly."
echo "The script needs to be run as root in order to work."
echo "Beginning installation..."
echo
echo "Installing/updating Neovim..."
add-apt-repository ppa:neovim-ppa/stable
apt update && apt install neovim curl ripgrep fd
echo "Installing config to the correct directory..."

if [ -d "$HOME/.config" ]
then
  mkdir "$HOME/.config"
fi

if [ -d "$HOME/.config/nvim" ]
then
  mkdir "$HOME/.config/nvim"
fi

cp -r . "$HOME/.config/nvim"
echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt update && apt install -y nodejs build-essential
echo "Success! You can launch Neovim now and enter the ':PlugInstall', and then the ':SetupCoc' command."
