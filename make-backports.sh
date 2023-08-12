#!/bin/bash 

sudo rm /etc/apt/sources.list
sudo cp /dots/sources.list /etc/apt/

sudo apt update 
sudo apt upgrade 

#make backports for wayland, wayland-protocols, libinput, swayimg

mkdir ./backports
cd ./backports

../scripts/backports-build.sh wayland
cd ./wayland-backports
../../backports-remove-dbg.sh
sudo apt install ./lib*.deb
cd ..

../scripts/backports-build.sh wayland-protocols
cd ./wayland-backports
../../backports-remove-dbg.sh
sudo apt install ./way*.deb
cd ..

../scripts/backports-build.sh libinput
cd ./wayland-backports
../../backports-remove-dbg.sh
sudo apt install ./lib*.deb
cd ..

../scripts/backports-build.sh swayimg
cd ./wayland-backports
../../backports-remove-dbg.sh
sudo apt install ./sway*.deb
cd ..
