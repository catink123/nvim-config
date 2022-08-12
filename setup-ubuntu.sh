#!/bin/bash
echo "Welcome to Catink123's Neovim Config bootstrapper script! This script installs neccesary packages for Neovim packages to work properly."
echo "The script may ask you to enter your root password to use the package manager."
echo "Beginning installation..."
echo
echo "Installing/updating Neovim..."
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update && sudo apt install neovim curl ripgrep fd python3
echo "Installing config to the correct directory..."

if [ ! -d "$HOME/.config" ]
then
  mkdir "$HOME/.config"
fi

if [ ! -d "$HOME/.config/nvim" ]
then
  mkdir "$HOME/.config/nvim"
fi

cp -r . "$HOME/.config/nvim"
echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt update && sudo apt install -y nodejs build-essential
echo "Success! You can launch Neovim now and enter the ':PlugInstall', and then the ':SetupCoc' command."
