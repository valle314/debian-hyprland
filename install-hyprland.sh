#!/bin/bash

sudo rm -rf Hyprland/

#building hyprland
echo "building hyprland"
git clone --recursive https://github.com/hyprwm/Hyprland

sudo rm -rf ~/.config/hypr
mkdir -p  ~/.config/hypr

cp -r hypr/hyprland.conf ~/.config/hypr/
cp -r hypr/xdg-portal-hyprland ~/.config/hypr/
cp -r hypr/hyprpaper.conf ~/.config/hypr/

# wlroots patch for nvidia and screen sharing
# sed -i 's/glFlush();/glFinish();/g' Hyprland/subprojects/wlroots/render/gles2/renderer.c
# sudo rm Hyprland/subprojects/wlroots/types/output/render.c
# cp -R wlrootspatch/render.c Hyprland/subprojects/wlroots/types/output/

cd Hyprland
cd subprojects
git clone https://gitlab.freedesktop.org/emersion/libdisplay-info
git clone https://github.com/emersion/libliftoff
cd ..
meson build
ninja -C build
sudo ninja -C build install 


for SOFT in xdg-desktop-portal-gnome xdg-desktop-portal-gtk 
do
    sudo apt remove -y $SOFT
done

sudo apt install --no-install-recommends -y xdg-desktop-portal-wlr xdg-desktop-portal

echo "done!"

