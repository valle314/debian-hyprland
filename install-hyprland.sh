#!/bin/bash

sudo rm -rf Hyprland/

#building hyprland
echo "building hyprland"
git clone --recursive https://github.com/hyprwm/Hyprland --branch v0.28.0 --single-branch

sudo rm -rf ~/.config/hypr
yes | cp -ir ./home_dots/.config/hypr ~/.config

# wlroots patch for nvidia and screen sharing
sed -i 's/glFlush();/glFinish();/g' Hyprland/subprojects/wlroots/render/gles2/renderer.c
sudo rm Hyprland/subprojects/wlroots/types/output/render.c
cp -R wlrootspatch/render.c Hyprland/subprojects/wlroots/types/output/

cd Hyprland
cd subprojects
git clone https://gitlab.freedesktop.org/emersion/libdisplay-info --branch 0.1.1 --single-branch
git clone https://gitlab.freedesktop.org/emersion/libliftoff --branch v0.4.1 --single-branch

cd ..
meson build
ninja -C build
sudo ninja -C build install 


for SOFT in xdg-desktop-portal-gnome xdg-desktop-portal-gtk 
do
    sudo apt remove -y $SOFT
done

echo "done!"

