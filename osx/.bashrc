#!/bin/bash

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/.bash_exports ]; then
  source ~/.bash_exports
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/marco/.sdkman"
[[ -s "/Users/marco/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/marco/.sdkman/bin/sdkman-init.sh"
