#/bin/bash

sudo apt install -y unzip 

mkdir -p ~/.local/share/fonts/nerd-fonts/

mv ${1} ~/.local/share/fonts/nerd-fonts/
cd ~/.local/share/fonts/nerd-fonts/

base_name=$(basename ${1})

unzip ${base_name}

fc-cache -vf
