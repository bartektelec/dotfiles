#!/bin/bash

selected=$1

newfile=${selected%.enc}

openssl aes-256-cbc -d -in $selected -out $newfile -iter 10
