#!/bin/bash

PORT_PACKAGES="htop watch"
BREW_PACKAGES="git bash-completion"

echo
echo "Updating MacPorts"
echo
sudo port selfupdate
sudo port upgrade outdated

echo "Installing packages from MacPorts"
echo "Install packages: ${PORT_PACKAGES}"
echo
sudo port install -y ${PORT_PACKAGES}

echo
echo "Updating HomeBrew"
echo
brew update
brew upgrade

echo
echo "Installing packages from HomeBrew"
echo "Install packages: ${BREW_PACKAGES}"
echo
brew install -y ${BREW_PACKAGES}
