#!/bin/bash

selected=$(find ./secrets -mindepth 1 -maxdepth 3 -type f -name *.enc | fzf)

newfile=${selected%.enc}

openssl aes-256-cbc -d -in $selected -out $newfile -iter 10
