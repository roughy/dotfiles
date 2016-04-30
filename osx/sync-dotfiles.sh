#!/bin/bash

rsync --exclude ".git/" --exclude ".DS_Store" --exclude "sync*.sh" \
      --exclude "install*.sh" --exclude "basic-setup.sh" --exclude "README.md" \
      -avh --no-perms . ~;

