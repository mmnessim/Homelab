#! /bin/bash

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
