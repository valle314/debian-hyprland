#!/bin/bash 

sudo apt update 
sudo apt upgrade 

#make backports for wayland, wayland-protocols, libinput, swayimg

mkdir ./backports
cd ./backports

../scripts/backports-build.sh wayland
cd ./wayland-backports
../../scripts/backports-remove-dbg.sh
sudo apt install ./lib*.deb
cd ..

../scripts/backports-build.sh wayland-protocols
cd ./wayland-protocols-backports
../../scripts/backports-remove-dbg.sh
sudo apt install ./way*.deb
cd ..

../scripts/backports-build.sh libinput
cd ./libinput-backports
../../scripts/backports-remove-dbg.sh
sudo apt install ./lib*.deb
cd ..

../scripts/backports-build.sh swayimg
cd ./swayimg-backports
../../scripts/backports-remove-dbg.sh
sudo apt install ./sway*.deb
cd ..
