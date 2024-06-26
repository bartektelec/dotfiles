#!/bin/bash

os=$(./get_os.sh)

manager=brew
font_dir=c:/windows/fonts

if [[ "$os" == "linux" ]]; then
  manager=apt
  $manager update
fi

if [[ "$os" == "windows" ]]; then
  manager=choco
  $manager install mingw
fi

$manager install git
$manager install fzf
$manager install fd
$manager install ripgrep
$manager install zoxide
$manager install lazygit
$manager install cmake
$manager install neovim
$manager install notion
$manager install chrome
$manager install arc
$manager install slack
$manager install discord
$manager install vscode
$manager install docker
$manager install tabby
$manager install wezterm
$manager install volta
$manager install azure-data-studio

volta install node
volta install pnpm

cp -i ./fonts/*.ttf $font_dir
