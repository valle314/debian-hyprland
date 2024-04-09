#!/bin/bash

convert -size 1920x1080 canvas:transparent PNG32:wall_2K.png
convert -size 1920x1080 canvas:transparent PNG32:wall_anime2_2K.png
convert -size 1920x1080 canvas:transparent PNG32:wall_anime_2K.png

convert -size 3840x2160 canvas:transparent PNG32:wall_4K.png
convert -size 3840x2160 canvas:transparent PNG32:wall_anime2_4K.png
convert -size 3840x2160 canvas:transparent PNG32:wall_anime_4K.png

convert -size 7680x4320 canvas:transparent PNG32:wall_8K.png
convert -size 7680x4320 canvas:transparent PNG32:wall_anime2_8K.png
convert -size 7680x4320 canvas:transparent PNG32:wall_anime_8K.png

sudo rm -rf /usr/local/share/hyprland/wall_2K.png
sudo rm -rf /usr/local/share/hyprland/wall_4K.png
sudo rm -rf /usr/local/share/hyprland/wall_8K.png
sudo rm -rf /usr/local/share/hyprland/wall_anime2_2K.png
sudo rm -rf /usr/local/share/hyprland/wall_anime2_4K.png
sudo rm -rf /usr/local/share/hyprland/wall_anime2_8K.png
sudo rm -rf /usr/local/share/hyprland/wall_anime_2K.png
sudo rm -rf /usr/local/share/hyprland/wall_anime_4K.png
sudo rm -rf /usr/local/share/hyprland/wall_anime_8K.png

sudo cp -r ./wall_2K.png /usr/local/share/hyprland/
sudo cp -r ./wall_4K.png /usr/local/share/hyprland/
sudo cp -r ./wall_8K.png /usr/local/share/hyprland/
sudo cp -r ./wall_anime2_2K.png /usr/local/share/hyprland/
sudo cp -r ./wall_anime2_4K.png /usr/local/share/hyprland/
sudo cp -r ./wall_anime2_8K.png /usr/local/share/hyprland/
sudo cp -r ./wall_anime_2K.png /usr/local/share/hyprland/
sudo cp -r ./wall_anime_4K.png /usr/local/share/hyprland/
sudo cp -r ./wall_anime_8K.png /usr/local/share/hyprland/

sudo rm -rf ./wall_2K.png 
sudo rm -rf ./wall_4K.png 
sudo rm -rf ./wall_8K.png 
sudo rm -rf ./wall_anime2_2K.png 
sudo rm -rf ./wall_anime2_4K.png 
sudo rm -rf ./wall_anime2_8K.png 
sudo rm -rf ./wall_anime_2K.png 
sudo rm -rf ./wall_anime_4K.png 
sudo rm -rf ./wall_anime_8K.png 
