old_pwd=$(pwd)

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find ~/projects ~/ -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(ps | grep tmux | wc -l)
running_session=$(tmux ls | grep $selected_name | wc -l)
TMUX="command tmux -2 ${@}"

create_new() {
  echo "Creating new session"

  cd $selected
  tmux new-session -ds $selected_name -c $selected
  tmux new-window -t $selected_name: -n term
  tmux new-window -t $selected_name: -n zsh
  sleep 10

  tmux split-window -t $selected_name:2 -v
  tmux send-keys -t "$selected_name:1" C-z "cd $selected && nvim" Enter
  tmux rename-window -t "$selected_name:1" nvim
  tmux selectw -t $selected_name:1
  cd $old_pwd

  tmux attach -t $selected_name
}

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  create_new
  exit 0
fi

if [ $running_session -eq 0 ]; then
  create_new
  exit 0
fi

echo "Found session"
tmux attach -t $selected_name
