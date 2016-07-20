#!/bin/bash

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -d ~/bin ]; then
  export PATH="~/bin:$PATH"
fi

# MacPorts Installer addition on 2016-02-22_at_12:05:59: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/marco/.sdkman"
[[ -s "/Users/marco/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/marco/.sdkman/bin/sdkman-init.sh"

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
