#PS1='[\u@\h \W]\$ '  # Закомментируйте значение по умолчанию
#DO NOT USE RAW ESCAPES, USE TPUT
reset=$(tput sgr0)
red=$(tput setaf 1)
blue=$(tput setaf 4)
green=$(tput setaf 2)

PS1='\n \[$red\]\u\[$reset\] \[$blue\]\w\[$reset\] \[$red\]\$ \[$reset\]\[$green\] \n '


# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

#export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'
export HISTCONTROL=ignoreboth
export HISTIGNORE='history*'

# Set the terminal title to show the current running command
# while it's running
trap 'echo -ne "\033]2;$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//g")\007"' DEBUG

export PATH=$PATH:/home/lubuntu/.local/bin
eval "$(stack --bash-completion-script stack)"

