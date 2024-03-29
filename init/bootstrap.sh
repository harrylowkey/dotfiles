#! /bin/bash

info () {
  printf "\r  [\033[00;34m..\033[0m] %s \n" "$1"
}

user () {
  printf "\r  [\033[0;33m??\033[0m] %s \n" "$1"
}

success () {
  printf "\r\033[2K [\033[00;32mOK\033[0m] %s \n" "$1"
}

fail () {
  printf "\r\033[2K [\033[0;31mFAIL\033[0m] %s \n" "$1"
  echo ''
  exit
}

install_homebrew() {
  read -r -p "Do you want to install homebrew? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew update --force --quiet
    success "Installed homebrew 🎉"
  fi
}

install_zsh() {
 read -r -p "Do you want to install zsh? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    success "Installed zsh 🎉"
  fi
}

config_git() {
  read -r -p "Do you want to setup git? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install git
    git config --global user.name  "$1"
    git config --global user.email "$2"
    git config --global color.ui true

    success "Setup Git Successfully"

    brew install lazygit
    success "Installed Lazygit"
  fi
}

install_fonts() {
 read -r -p "Do you want to install fonts? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
  fi
}


install_tools() {
 read -r -p "Do you want to install some tools? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install thefuck 
    $(brew --prefix)/opt/fzf/install
    brew install kubectx

    success "Installed thefuck, fzf, kubectx"

    brew install --cask warp
    brew install --cask raycast

    success "Installed warp, raycast"
  fi
}

install_homebrew
install_zsh
config_git
install_tools
install_fonts

echo "Finish Install! 🎉 🚀"
