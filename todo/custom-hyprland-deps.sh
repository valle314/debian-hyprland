#!/bin/bash

# prefix_dir="${HOME}/.local"
# mkdir -p prefix_dir

# sudo apt install --no-install-recommends -y libffi-dev 
# sudo apt install --no-install-recommends -y libmtdev-dev 
# sudo apt install --no-install-recommends -y libevdev-dev 
# sudo apt install --no-install-recommends -y libwacom-dev 
# sudo apt install --no-install-recommends -y libgtk-3-dev 
# sudo apt install --no-install-recommends -y libgtk-4-dev 
# sudo apt install --no-install-recommends -y check
# sudo apt install --no-install-recommends -y eglexternalplatform-dev

# git clone https://gitlab.freedesktop.org/wayland/wayland --branch 1.22.0 --depth 1
# cd wayland 
# meson build/ --prefix=$prefix_dir -Ddocumentation=false
# ninja -C build/ install
# cd ..
# sudo rm -rf ./wayland

# git clone https://gitlab.freedesktop.org/wayland/wayland-protocols --branch 1.34 --depth 1
# cd wayland-protocols 
# meson build/ --prefix=$prefix_dir
# ninja -C build/ install
# cd ..
# sudo rm -rf ./wayland-protocols

# git clone https://gitlab.freedesktop.org/libinput/libinput --branch 1.25.0 --depth 1
# cd libinput 
# meson build/ --prefix=$prefix_dir
# ninja -C build/ install
# cd ..
# sudo rm -rf ./libinput

# git clone https://github.com/NVIDIA/egl-wayland --branch 1.1.13 --depth 1
# cd egl-wayland 
# meson build/ --prefix=$prefix_dir
# ninja -C build/ install
# cd ..
# sudo rm -rf ./egl-wayland
