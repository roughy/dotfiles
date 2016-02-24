#!/bin/bash

rsync --exclude ".git/" --exclude ".DS_Store" --exclude "sync.sh" \
		--exclude "README.md" -avh --no-perms . ~;

