# ~/.bash_profile

PATH=$PATH:~/.local/bin
PATH=$PATH:~/.local/scripts

export PYTHONPATH=/home/valentin/.local/lib/miniconda3/lib/python3.10/site-packages

export TASKRC=~/.config/task/.taskrc
export TASKDATA=~/.local/share/task/.task task list
export EDITOR="nvim"
export SUDO_EDITOR=/home/valentin/.local/bin/nvim

export HISTFILESIZE=5000000

# for note taking
export NOTEROOT=~/docs/notes  

# for sessions in neovim
export SESSIONS=~/dev/sessions

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"
