#!/bin/bash

PORT_PACKAGES="htop watch wget"
BREW_PACKAGES="git bash-completion"

EXIT_CODE=0
NAME_SCRIPT=`basename "$0"`
COLOR_YELLOW="\033[1;33m"
COLOR_RESET="\033[0m"

function print() {
  message=$1
  echo -e "[${COLOR_YELLOW}${NAME_SCRIPT}${COLOR_RESET}] ${message}"
}

function checkExitCode() {
  errorMessage=$1
  if [ $? -ne 0 ]; then
    print $1
    EXIT_CODE=1
  fi
}

function stopOnErrors() {
  if [ $EXIT_CODE -ne 0 ]; then
    print "Please fix the errors described above and run this script again."
    exit ${EXIT_CODE}
  fi
}

CMD_PORT=`which port`
checkExitCode "MacPorts installation not found. Please visit https://www.macports.org/install.php"

CMD_BREW=`which brew`
checkExitCode "HomeBrew installation not found. Please run the basic-setup.sh script."

stopOnErrors

echo
print "Updating MacPorts"
echo
sudo port selfupdate
sudo port upgrade outdated

print "Installing packages from MacPorts"
print "Install packages: ${PORT_PACKAGES}"
echo
sudo port install -y ${PORT_PACKAGES}

echo
print "Updating HomeBrew"
echo
brew update
brew upgrade

echo
print "Installing packages from HomeBrew"
print "Install packages: ${BREW_PACKAGES}"
echo
brew install -y ${BREW_PACKAGES}
