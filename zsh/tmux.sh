# should be used by .oh-my-zsh

# launch into a TMUX shell by default

tmux attach -t MAIN &> /dev/null

if [[ ! $TERM =~ screen ]]; then
    exec tmux new -s MAIN
fi
