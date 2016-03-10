if [ -f ~/bash_aliases/.cheatsheet ]; then
  source ~/bash_aliases/.cheatsheet
fi

# profile
alias profile='source ~/.bash_profile'

# window title
alias wtitle="printf '\033]0;%s\007'"

# listing
alias l='ls'
alias ls='ls'
alias ll='ls -l'
alias la='ls -lA'

# change directories
cd() {                                      # Always list directory contents upon 'cd' 
  builtin cd "$@"; 
  ll;
}
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias ~="cd ~"                              # Go Home

# docker 
set-docker-image-name() {
  export D_IMAGE_NAME="$1";
  echo "D_IMAGE_NAME=${D_IMAGE_NAME}";
}
set-docker-container-id() {
  export D_CONTAINER_ID="$1";
  echo "D_CONTAINER_ID=${D_CONTAINER_ID}";
}

