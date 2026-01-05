#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install curl -y
sudo apt install zsh -y

# Homebrew installation script
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

