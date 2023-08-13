# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias apti='sudo apt install --no-install-recommends'
alias aptr='sudo apt remove'
alias apts='apt search'

alias r='. ranger'

alias en_to_de='trans -brief en:de'
alias de_to_en='trans -brief de:en'
alias de_to_ru='trans -brief de:ru'
alias ru_to_de='trans -brief ru:de'

alias vit='vit list'

PS1='[\u@\h \W]\$ '

