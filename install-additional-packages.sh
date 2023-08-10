#!/bin/bash

#installing packages for better usability
#dunst: for notifications
#grim, slurp and swappy: for screenshots
#hyprpaper: for backgrounds
#copyq: for clipboard
#pavucontrol: audio
#xdg-user-dir: user directories(downloads, pictures, ...)
#hyprpaper: background
#wlogout: logout screen
#udiskie: managing removable media
#swayimg: image viewer
#nwg-look: for gtk settings

# echo "installing additional packages"
# for SOFTWR in pipewire wireplumber dunst grim slurp swappy pavucontrol xdg-user-dirs hyprpaper wlogout udiskie swayimg nwg-look catppuccin-gtk-theme-mocha
# do
#        install_software $SOFTWR 
# done

#create user dirs
sudo rm -rf ~/.config/user-dirs.dirs
sudo rm -rf ~/.config/user-dirs.locale
touch ~/.config/user-dirs.dirs
touch ~/.config/user-dirs.locale

cat <<EOT >> ~/.config/user-dirs.dirs
XDG_DESKTOP_DIR="\$HOME/desktop"
XDG_DOWNLOAD_DIR="\$HOME/downloads"
XDG_TEMPLATES_DIR="\$HOME/templates"
XDG_PUBLICSHARE_DIR="\$HOME/public"
XDG_DOCUMENTS_DIR="\$HOME/docs"
XDG_MUSIC_DIR="\$HOME/music"
XDG_PICTURES_DIR="\$HOME/pics"
XDG_VIDEOS_DIR="\$HOME/videos"
EOT

cat <<EOT >> ~/.config/user-dirs.locale
en_US
EOT

mkdir -p ~/desktop/
mkdir -p ~/downloads/
mkdir -p ~/templates/
mkdir -p ~/public/
mkdir -p ~/docs/
mkdir -p ~/music/
mkdir -p ~/pics/
mkdir -p ~/pics/screenshots/
mkdir -p ~/pics/wallpaper/
mkdir -p ~/videos/

cp -R wallpaper/my_wallpaper.jpg ~/pics/wallpaper/

mkdir -p ~/.config/hypr/
cp -R hypr/hyprpaper.conf ~/.config/hypr/

echo "done!"



#hyprpicker!!!
#additional packages one might install:
#thunar/vifm/ranger/lf/nnn: file manager 
#thunar-archive-plugin: Adds archive operations to the Thunar file context menus
#gvfs:virtual file system
#file-roller: Create and modify archives
#waybar/ironbar/gbar: status bar
#install rustup: https://rustup.rs/
#mpv: video player
#swaylock-effects: login effects
#
#
#
#and so on..
#https://suckless.org/rocks/
#https://github.com/natpen/awesome-wayland
#
#
#
#IF YOU HAVE SOME PROBLEMS WITH NVIDIA AND QT OR ELECTRON APPS:
#for qt: qt5-wayland qt5ct 
#fixing electron crashin: nvidia-vaapi-driver-git
