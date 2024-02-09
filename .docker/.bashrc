PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

alias ls="ls --color=auto -h"
alias ll="ls --color=auto -lh"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias n="npm run"
alias m="make"

shopt -s histappend
set -o vi

# ud 10  cd up to 10 dirs
# ud <dirname> cd up to <dirname>
function ud() {
  case $1 in
    *[!0-9]*)                                          # if no a number
      cd $( pwd | sed -r "s|(.*/$1[^/]*/).*|\1|" )     # search dir_name in current path, if found - cd to it
      ;;                                               # if not found - not cd
    *)
      cd $(printf "%0.0s../" $(seq 1 $1));             # cd ../../../../  (N dirs)
    ;;
  esac
}
