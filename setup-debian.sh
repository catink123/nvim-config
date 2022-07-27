echo "Welcome to Catink123's Neovim Config bootstrapper script! This script installs neccesary packages for Neovim packages to work properly."
echo "The script may ask you to enter your root password to use the package manager."
echo "Beginning installation..."
echo
echo "Installing/updating Neovim..."
sudo apt-get update && sudo apt-get install neovim
echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get update && sudo apt-get install -y nodejs build-essentials 
echo "Insalling Yarn..."
npm install --global yarn
echo "Success! You can launch Neovim now and enter the `:SetupConfig` command."