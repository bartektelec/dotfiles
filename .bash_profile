if [ -t 1 ]; then
  exec zsh
fi

source ~/aliases.sh
source ~/func.sh

eval "$(zoxide init bash)"
