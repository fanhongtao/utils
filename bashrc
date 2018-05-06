
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/utils/git-completion.bash ]; then
    source ~/utils/git-completion.bash
    export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi


