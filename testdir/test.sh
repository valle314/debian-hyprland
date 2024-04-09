#!/bin/bash

git clone https://github.com/Alexays/Waybar --branch 0.10.0 --single-branch --recursive --depth 1
cd Waybar
meson setup build --default-library=static --buildtype=release -Dexperimental=true
meson compile -C build
cp ./build/waybar ~/.local/bin
cd ..
sudo rm -rf ./Waybar
