#!/bin/bash

sudo apt update && sudo apt upgrade

#setup nvidia
echo -e "nvidia setup stage"
sudo apt install nvidia-detect
sudo nvidia-detect
for SOFTWR in linux-headers libva-wayland2  
do
    sudo apt install $SOFTWR
done

echo "now run the configure-nvidia script"
