#!/bin/bash

os=$(./get_os.sh)

NVIM_DIR=~/.config/nvim
SESSIONIZER_FILE=./ts.sh

if [[ $os == "windows" ]]; then
  NVIM_DIR=~/AppData/Local/nvim
  SESSIONIZER_FILE=./ts_win32.sh
fi

echo "Decode .npmrc"
./scripts/decode_file.sh ./secrets/.npmrc.enc
echo "Decode .gitconfig"
./scripts/decode_file.sh ./secrets/.gitconfig.enc

cp -i ./.zshrc ~/.zshrc
cp -i ./.bash_profile ~/.bash_profile
cp -i ./.tmux.conf ~/.tmux.conf
cp -i ./tabby.config.yaml "$TABBY_CONFIG_DIRECTORY/config.yaml"
cp -ip ./aliases.sh ~/aliases.sh
cp -ip ./func.sh ~/func.sh
cp -i ./secrets/.npmrc ~/.npmrc
cp -i ./secrets/.gitconfig ~/.gitconfig
cp -ip $SESSIONIZER_FILE ~/ts.sh

cp -ir ./nvim/* $NVIM_DIR
