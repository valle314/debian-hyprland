#!/bin/bash

sudo rm -rf Hyprland/

#install all dependencies for hyprland
echo -e "installing dependencies for hyprland"
for SOFTWR in meson wget build-essential ninja-build cmake-extras cmake gettext gettext-base fontconfig libfontconfig-dev libffi-dev libxml2-dev libdrm-dev libxkbcommon-x11-dev libxkbregistry-dev libxkbcommon-dev libpixman-1-dev libudev-dev libseat-dev seatd libxcb-dri3-dev libvulkan-dev libvulkan-volk-dev  vulkan-validationlayers-dev libvkfft-dev libgulkan-dev libegl-dev libgles2 libegl1-mesa-dev glslang-tools libinput-bin libinput-dev libxcb-composite0-dev libavutil-dev libavcodec-dev libavformat-dev libxcb-ewmh2 libxcb-ewmh-dev libxcb-present-dev libxcb-icccm4-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-xinput-dev xdg-desktop-portal-wlr libwayland-dev wayland-protocols jq foot 
do
       sudo apt install -y $SOFTWR 
done

echo "updating packages"

#building hyprland
echo "building hyprland"
git clone --recursive https://github.com/hyprwm/Hyprland

sudo rm -rf ~/.config/hypr/
mkdir -p  ~/.config/hypr/

cp -r hypr/hyprland.conf ~/.config/hypr/
cp -r hypr/xdg-portal-hyprland ~/.config/hypr/
cp -r hypr/hyprpaper.conf ~/.config/hypr/

#nvidia patch
sed -i 's/glFlush();/glFinish();/g' Hyprland/subprojects/wlroots/render/gles2/renderer.c

sudo rm Hyprland/subprojects/wlroots/types/output/render.c
cp -R wlrootspatch/render.c Hyprland/subprojects/wlroots/types/output/

cd Hyprland
sudo make install

for SOFT in xdg-desktop-portal-gnome xdg-desktop-portal-gtk 
do
    sudo apt remove $SOFT
done

echo "done!"
