#!/bin/bash 

sudo apt update 
sudo apt upgrade 

#make backports for wayland, wayland-protocols, libnvidia-egl-wayland1, libinput, swayimg

mkdir ./backports
cd ./backports

../scripts/backports-build.sh wayland
cd ./wayland-backports
../../scripts/backports-remove-dbg.sh
sudo apt install ./*.deb
cd ..

../scripts/backports-build.sh wayland-protocols
cd ./wayland-protocols-backports
../../scripts/backports-remove-dbg.sh
sudo apt install ./*.deb
cd ..

../scripts/backports-build.sh libinput
cd ./libinput-backports
../../scripts/backports-remove-dbg.sh
sudo apt install ./*.deb
cd ..

../scripts/backports-build.sh libnvidia-egl-wayland1
cd ./libnvidia-egl-wayland1-backports
../../scripts/backports-remove-dbg.sh
sudo apt install ./*.deb
cd ..

# ../scripts/backports-build.sh swayimg
# cd ./swayimg-backports
# ../../scripts/backports-remove-dbg.sh
# sudo apt install ./*.deb
# cd ..

