if [ -t 1 ]; then
  exec zsh
fi

source .aliases
source .functions

eval "$(zoxide init bash)"
