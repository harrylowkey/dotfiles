#! /bin/bash

install_homebrew() {
  read -r -p "Do you want to install homebrew? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew update --force --quiet
    echo "Installed homebrew 🎉"
  fi
}

install_zsh() {
 read -r -p "Do you want to install zsh? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "Installed zsh 🎉"
  fi
}

install_ohmyzsh() {
  read -r -p "Do you want to install oh-my-zsh? [y|N] " response
    if [[ $response =~ (y|yes|Y) ]];then
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
}

install_thefuck() {
 read -r -p "Do you want to install thefuck? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install thefuck 
    echo "Installed thefuck 🎉"
  fi
}

install_homebrew
install_zsh
install_ohmyzsh
install_thefuck

echo "Finish Install! 🎉 🚀"
