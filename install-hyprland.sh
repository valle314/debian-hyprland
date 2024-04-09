#!/bin/bash

sudo rm -rf Hyprland/

#building hyprland
echo "building hyprland"
git clone https://github.com/hyprwm/Hyprland --branch v0.29.1 --single-branch --depth 1 --recursive 

sudo rm -rf ~/.config/hypr
mkdir -p  ~/.config/hypr

yes | cp -ir home_dots/.config/hypr ~/.config/

# wlroots patch for nvidia and screen sharing
sed -i 's/glFlush();/glFinish();/g' Hyprland/subprojects/wlroots/render/gles2/renderer.c
sudo rm Hyprland/subprojects/wlroots/types/output/render.c
cp -R wlrootspatch/render.c Hyprland/subprojects/wlroots/types/output/

cd Hyprland
cd subprojects
git clone https://gitlab.freedesktop.org/emersion/libdisplay-info --branch 0.1.1 --single-branch --depth 1 --recursive
git clone https://gitlab.freedesktop.org/emersion/libliftoff --branch v0.4.1 --single-branch --depth 1 --recursive
git clone https://gitlab.freedesktop.org/wayland/wayland --branch 1.22.0 --single-branch --depth 1 --recursive
git clone https://gitlab.freedesktop.org/wayland/wayland-protocols --branch 1.34 --single-branch --depth 1 --recursive
git clone https://gitlab.freedesktop.org/libinput/libinput --branch 1.25.0 --single-branch --depth 1 --recursive
git clone https://github.com/NVIDIA/egl-wayland --branch 1.1.13 --single-branch --depth 1 --recursive

cd ..
meson setup build --default-library=static --buildtype=release
meson compile -C build
# ninja -C build
#TODO VERSUCHE STATISCH ZU BAUEN???? DANN MUSST EVENTUELL WENIGER DEPS INSTALLIEREN UND HAST NUR EINE GROßE HYPRLAND BINARY


# sudo ninja -C build install 
#
#
# for SOFT in xdg-desktop-portal-gnome xdg-desktop-portal-gtk 
# do
#     sudo apt remove -y $SOFT
# done
#
# sudo rm -rf Hyprland/
#
# echo "done!"


