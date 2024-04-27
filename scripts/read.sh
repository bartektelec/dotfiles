#!/bin/bash

selected=$(find ./secrets -maxdepth 3 -mindepth 1 -type f -name *.enc | fzf)

openssl aes-256-cbc -d -in $selected -iter 10 | bat
