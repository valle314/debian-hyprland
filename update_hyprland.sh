#!/bin/bash

sudo rm -rf Hyprland/

echo "building hyprland"
git clone --recursive https://github.com/hyprwm/Hyprland

#nvidia patch
sed -i 's/glFlush();/glFinish();/g' Hyprland/subprojects/wlroots/render/gles2/renderer.c

sudo rm Hyprland/subprojects/wlroots/types/output/render.c
cp -R wlrootspatch/render.c Hyprland/subprojects/wlroots/types/output/

cd Hyprland
sudo make install

for SOFT in xdg-desktop-portal-gnome xdg-desktop-portal-gtk 
do
    sudo apt get remove $SOFT
done

echo "done!"
