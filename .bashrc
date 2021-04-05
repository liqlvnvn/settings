export PAGER="/usr/bin/most -s"
export EDITOR="/usr/bin/vim"
export VISUAL="/usr/bin/vim"
export SHELL="/usr/bin/bash"
export BROWSER="/usr/bin/brave"

PLAN9=/usr/local/plan9
export PLAN9
PATH=$PATH:$PLAN9/bin:$HOME/.local/statusbar
export PATH
# Add Golang bin path to PATH
export PATH=$PATH:/usr/local/go/bin:~/.local/bin:~/projects/go/bin
export GOPATH=$HOME/projects/go


#PS1='[\u@\h \W]\$ '  # Закомментируйте значение по умолчанию
#DO NOT USE RAW ESCAPES, USE TPUT
reset=$(tput sgr0)
red=$(tput setaf 1)
blue=$(tput setaf 4)
green=$(tput setaf 2)

#PS1='\n \[$red\]\u\[$reset\] \[$blue\]\w\[$reset\] \[$red\]\$ \[$reset\]\[$green\] \n '
PS1='\n \[$blue\]\w\[$reset\] \[$red\]\$ \[$reset\]\[$green\] \n '


# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

#export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'
export HISTCONTROL=ignoreboth
export HISTIGNORE='history*'

# Set the terminal title to show the current running command
# while it's running
trap 'echo -ne "\033]2;$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//g")\007"' DEBUG

# Set color settings for ls command
LS_COLORS=$LS_COLORS:'di=1;35:'
export LS_COLORS

export PATH=$PATH:/home/lubuntu/.local/bin
eval "$(stack --bash-completion-script stack)"

alias yt='youtube-dl --format webm'
alias ytu='sudo pip3 install -U youtube-dl'
alias ls='ls --color=auto'
alias ha='hledger add'
alias hp='hledger print'
alias off='sudo poweroff'
alias update='sudo apt update && sudo apt upgrade'
alias config='/usr/bin/git --git-dir=$HOME/soft/settings.git --work-tree=$HOME'
# some more ls aliases
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CFlh'
alias woo='fortune'
alias lsd="ls -alF | grep /$"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lh"
alias la="ls -la"
alias sl="ls"
alias l="ls"
alias s="ls"

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Coloring man pages
# Using this advices
# https://www.tecmint.com/view-colored-man-pages-in-linux/
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
      #exec startx
#fi

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg


extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }
