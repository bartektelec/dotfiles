case "$TERM" in
    xterm*|rxvt*)
        function xtitle () {
            builtin print -n -- "\e]0;$@\a"
        }
        ;;
    screen)
        function xtitle () {
            builtin print -n -- "\ek$@\e\\"
        }
        ;;
    *)
        function xtitle () {
        }
esac


last_two_dirs() {
    local left=${PWD%/*};
    echo "${PWD#${left%/*}/}"
}

function precmd () {
  xtitle "$(print -P zsh $(last_two_dirs))"
}
 function preexec () {
    xtitle "> $1"
}
