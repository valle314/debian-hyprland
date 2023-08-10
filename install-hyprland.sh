#!/bin/bash

sudo rm -rf Hyprland/

#install all dependencies for hyprland
echo -e "installing dependencies for hyprland"
for SOFTWR in sudo apt-get install -y meson wget build-essential ninja-build cmake-extras cmake gettext gettext-base fontconfig libfontconfig-dev libffi-dev libxml2-dev libdrm-dev libxkbcommon-x11-dev libxkbregistry-dev libxkbcommon-dev libpixman-1-dev libudev-dev libseat-dev seatd libxcb-dri3-dev libvulkan-dev libvulkan-volk-dev  vulkan-validationlayers-dev libvkfft-dev libgulkan-dev libegl-dev libgles2 libegl1-mesa-dev glslang-tools libinput-bin libinput-dev libxcb-composite0-dev libavutil-dev libavcodec-dev libavformat-dev libxcb-ewmh2 libxcb-ewmh-dev libxcb-present-dev libxcb-icccm4-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-xinput-dev xdg-desktop-portal-wlr foot
do
       sudo apt install $SOFTWR 
done

echo "updating packages"

#building hyprland
echo "building hyprland"
git clone --recursive https://github.com/hyprwm/Hyprland

cp -n hypr/hyprland.conf ~/.config/hypr/
cp -n hypr/xdg-portal-hyprland ~/.config/hypr/

#nvidia patch
#TODO
# sed -i 's/glFlush();/glFinish();/g' Hyprland/subprojects/wlroots/render/gles2/renderer.c
#
# sudo rm Hyprland/subprojects/wlroots/types/output/render.c
# cp -R wlrootspatch/render.c Hyprland/subprojects/wlroots/types/output/

cd Hyprland
sudo make install

for SOFT in xdg-desktop-portal-gnome xdg-desktop-portal-gtk 
do
    sudo apt remove $SOFT
done

echo "done!"
