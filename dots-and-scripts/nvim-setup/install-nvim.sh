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

# installing packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo -e "installing some dependencies for plugins"
for SOFTWR in ripgrep zathura-pdf-poppler latex-mk wl-clipboard python-pynvim
do
       install_software $SOFTWR 
done

# copying nvim config to the .configs folder
sudo rm -rf ~/.config/nvim/
cp -r nvim/ ~/.config/

echo "now open nvim and run :PackerSync and then :MasonUpdate then :checkhealth"
