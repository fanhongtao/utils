# Link this file as user's .bash_aliases
#    ln -s utils/bash_aliases  ~/.bash_aliases

# Aliases for .bash_aliases
alias viba='vi ~/.bash_aliases'     # viba -> VI .BAsh_aliases
alias soba='source ~/.bash_aliases' # soba -> SOurce .BAsh_aliases

# Common aliases
alias ..='cd ..'
alias ...='cd ../..'
alias dos2unix='sed -i "s/\r//" '
alias fstr='find . -type f -printf "\"%p\"\n" | grep -v ".git" | grep -v ".vimproj" | xargs grep '
alias fname='find . -name '

# Aliases for Git
export GIT_EDITOR=vi
alias gita='git add '
alias gitc='git commit '
alias gitd='git diff '
alias gits='git status'
alias gitl='git log '

# other
alias tldr='docker run --rm -it -v ~/.config:/home/tldr/.config  fanhongtao/tldr'
alias docker-images='~/utils/docker-images.sh'

