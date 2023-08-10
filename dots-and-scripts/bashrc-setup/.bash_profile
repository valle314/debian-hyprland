# ~/.bash_profile

PATH=$PATH:/home/$USER/.local/bin
PATH=$PATH:/home/$USER/.local/scripts

PATH=$PATH:/home/$USER/.local/lib/miniconda3/bin

export EDITOR="nvim"
# export TEXMFHOME=~/.texmf

# for note taking
export NOTEROOT="/home/valentin/docs/notes"  

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"
