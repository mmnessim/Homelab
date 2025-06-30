#! /bin/bash

# This script is to be run on any fresh Debian install
# It installs docker, tailscale, github CLI, vim, and curl
# It needs to be run after sudo is set up with apt install sudo and sudo visudo to add desired user to sudoers

sudo apt update && sudo apt upgrade

echo "Installing Docker"

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Docker installed"

# Reset Tailscale

sudo apt-get remove -y tailscale
# Remove any existing Tailscale configuration
sudo rm -rf /var/lib/tailscale/tailscaled.state

# Install Tailscale
echo "Installing Tailscale"

curl -fsSL https://tailscale.com/install.sh | sh

sudo tailscale up

echo "Tailscale installed and configured"

# Install github CLI
echo "Installing GitHub CLI"

sudo apt install gh

echo "GitHub CLI installed"

echo "installing and configuring vim"

sudo apt update && sudo apt upgrade -y
sudo apt install -y vim

# Make sure curl is installed
sudo apt install -y curl

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -f "$HOME/.vimrc" ]; then
    echo "~/.vimrc already exists."
else
    echo "~/.vimrc does not exist."
    echo "Creating ~/.vimrc file."
fi

cat > ~/.vimrc <<EOF
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'WolfgangMehner/c-support'
Plug 'WolfgangMehner/bash-support'
call plug#end()

syntax on

set termguicolors

set tabstop=4
set softtabstop=4
set expandtab

set smartindent

set shiftwidth=4

set number
set numberwidth=4

set incsearch
set nohlsearch

set splitbelow
set splitright

set hidden

set scrolloff=8

set undofile

set mouse=a

set clipboard=unnamedplus

set ignorecase
set smartcase
EOF

echo "open vim and run :PlugInstall to install plugins"
