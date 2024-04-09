# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias apti='sudo apt install --no-install-recommends'
alias aptr='sudo apt remove'
alias apts='apt search'
alias aptl='apt list --installed'

alias reboot='systemctl reboot'
alias shutdown='systemctl poweroff'
alias poweroff='systemctl poweroff'
alias logout='loginctl terminate-user valentin'

alias r='. ranger'

alias en_to_de='trans -brief en:de'
alias de_to_en='trans -brief de:en'
alias de_to_ru='trans -brief de:ru'
alias ru_to_de='trans -brief ru:de'

alias vit='vit list'
. "$HOME/.cargo/env"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
