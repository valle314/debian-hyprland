#!/bin/bash

install_software() {
    #first lets see if the package is there
    if yay -Q $1 &>> /dev/null ; then
        echo "$1 is already installed."
    else
        #no package found so installing
        echo -e "now installing $1 ..."
        yay -S --noconfirm $1
        #test to make sure package installed
        if yay -Q $1 &>> /dev/null ; then
            echo -e "$1 was installed."
        else
            #if this is hit then a package is missing
            echo -e "$1 install had failed"
            exit
        fi
    fi
}

for SOFTWR in unzip
do
       install_software $SOFTWR 
done

mkdir -p ~/.local/share/fonts/
mkdir -p ~/.local/share/fonts/nerd-fonts/

mv ${1} ~/.local/share/fonts/nerd-fonts/
cd ~/.local/share/fonts/nerd-fonts/

base_name=$(basename ${1})

unzip ${base_name}

fc-cache -vf
