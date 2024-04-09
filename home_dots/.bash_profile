# ~/.bash_profile

PATH=$PATH:~/.local/bin
PATH=$PATH:~/.local/scripts

# c and c++ include path
export CPATH=~/.local/c_libraries/include
export LIBRARY_PATH=~/.local/c_libraries/lib

export TASKRC=~/.config/task/.taskrc
export TASKDATA=~/.local/share/task/.task task list
export EDITOR="nvim"
export SUDO_EDITOR=~/.local/bin/nvim

export HISTFILESIZE=5000000

# for note taking
export NOTEROOT=~/docs/notes  

# for sessions in neovim
export SESSIONS=~/dev/sessions

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
