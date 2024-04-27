#!/bin/bash

os="windows"

if [[ $# -gt 0 ]]; then
  os=$1
fi

NVIM_DIR=~/.config/nvim
TABBY_DIR=~/.config/tabby
SESSIONIZER_FILE=./ts.sh

if [[ $os == "windows" ]]; then
  NVIM_DIR=~/AppData/Local/nvim
  TABBY_DIR=~/AppData/Roaming/tabby
  SESSIONIZER_FILE=./ts_win32.sh
fi

echo "Decode .npmrc"
./scripts/decode_file.sh ./secrets/.npmrc.enc
echo "Decode .gitconfig"
./scripts/decode_file.sh ./secrets/.gitconfig.enc

cp -i ./.zshrc ~/.zshrc
cp -i ./.bash_profile ~/.bash_profile
cp -i ./.tmux.conf ~/.tmux.conf
cp -i ./tabby.config.yaml $TABBY_DIR/config.yaml
cp -i ./aliases.sh ~/aliases.sh
cp -i ./func.sh ~/func.sh
cp -i ./secrets/.npmrc ~/.npmrc
cp -i ./secrets/.gitconfig ~/.gitconfig
cp -i $SESSIONIZER_FILE ~/ts.sh

cp -ir ./nvim $NVIM_DIR
