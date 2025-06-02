export TERM=xterm-256color
export PAGER="/usr/bin/less"
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export SHELL="/usr/bin/bash"
export BROWSER="/usr/bin/brave"

# dwmblocks utils
export PATH=$PATH:$HOME/.local/statusbar

# Add Golang bin path to PATH
export PATH=$PATH:/usr/local/go/bin:~/.local/bin:~/projects/go/bin
export GOPATH=$HOME/projects/go

PS1='\[$blue\]\w\[$reset\] \[$red\]\$ \[$reset\]\[$green\]'

alias config='/usr/bin/git --git-dir=$HOME/.config/settings.git --work-tree=$HOME'

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

