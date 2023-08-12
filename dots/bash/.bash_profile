# ~/.bash_profile

PATH=$PATH:~/.local/bin/
PATH=$PATH:~/.local/scripts/

#PATH=$PATH:~/.local/lib/miniconda3/bin/

export EDITOR="nvim"
export SUDO_EDITOR=/home/valentin/.local/bin/nvim

# for note taking
export NOTEROOT="/home/valentin/docs/notes"  

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"