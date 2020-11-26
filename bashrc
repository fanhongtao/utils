
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/utils/git-completion.bash ]; then
    source ~/utils/git-completion.bash
    export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)") \$ '
fi


