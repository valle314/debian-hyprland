# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias r='. ranger'
alias y='yay'

alias en_to_de='trans -brief en:de'
alias de_to_en='trans -brief de:en'
alias de_to_ru='trans -brief de:ru'
alias ru_to_de='trans -brief ru:de'

alias vit='vit list'

PS1='[\u@\h \W]\$ '


. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/valentin/.local/lib/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/valentin/.local/lib/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/valentin/.local/lib/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/valentin/.local/lib/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

