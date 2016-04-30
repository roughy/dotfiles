#!/bin/bash

NAME_SCRIPT=`basename "$0"`
EXIT_CODE=0

COLOR_YELLOW="\033[1;33m"
COLOR_RESET="\033[0m"

function print() {
  message=$1
  echo -e "[${COLOR_YELLOW}${NAME_SCRIPT}${COLOR_RESET}] ${message}"
}

function checkCmdTool() {
  cmdTool=$1
  message=$2
  if [ $? -ne 0 ]; then
    print "${cmdTool} installation not found ${message}."
    EXIT_CODE=1
  fi
  print "${cmdTool} already installed"
}

function stopOnErrors() {
  if [ $EXIT_CODE -ne 0 ]; then
    print "Please fix the errors described above and run this script again."
    exit ${EXIT_CODE}
  fi
}

CMD_RUBY=`which ruby`
checkCmdTool "Ruby"

CMD_CURL=`which curl`
checkCmdTool "Curl"

CMD_PORT=`which port`
checkCmdTool "MacPorts" "Please visit https://www.macports.org/install.php"

stopOnErrors

echo 
print "Checking Xcode commandline tools"
xcode-select --install
if [ $? -eq 0 ]; then
  print "Please wait until the Xcode commandline tools are installed and rerun this script again."
  exit 0
fi
print "Xcode commandline tools are installed"

CMD_BREW=`which brew`
if [ $? -eq 0 ]; then
  ${CMD_RUBY} -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
fi
${CMD_RUBY} -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"