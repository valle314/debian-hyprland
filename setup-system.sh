#!/bin/bash

# user dirs
mkdir -p ~/.local/bin
cp -r scripts ~/.local/

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

mkdir -p ~/desktop
mkdir -p ~/downloads
mkdir -p ~/public
mkdir -p ~/docs
mkdir -p ~/music
mkdir -p ~/pics
mkdir -p ~/pics/screenshots
mkdir -p ~/pics/wallpaper
mkdir -p ~/videos
cp -r ./wallpaper/my_wallpaper.jpg ~/pics/wallpaper/
cp -r ./templates ~/

# foot
sudo apt install -y foot
sudo rm -rf ~/.config/foot
cp -r dots/foot ~/.config/

# ranger
sudo apt install -y fzf unzip tar udiskie fd-find ranger
sudo rm -rf ~/.config/ranger
cp -r dots/ranger ~/.config/
mkdir -p ~/.local/share/trash

# dragon
git clone https://github.com/mwh/dragon
cd dragon
make 
sudo rm ~/.local/bin/dragon
cp ./dragon ~/.local/bin/
cd ..
sudo rm -rf ./dragon

# neovim
## get some dependencies for neovim plugins
sudo apt install -y ripgrep latex-mk wl-clipboard python3-pynvim curl

git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=~/.local
sudo make install
cd ..
sudo rm -rf ./neovim

## packer for neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/pack/packer/start/packer.nvim

## dots for neovim  
sudo rm -rf ~/.config/nvim
cp -r dots/nvim ~/.config/ 

# sioyek
sudo apt install -y sioyek
sudo rm -rf ~/.config/sioyek
cp -r dots/sioyek ~/.config/ 

# bash
sudo rm ~/.profile
sudo rm ~/.bashrc
sudo rm ~/.bash_profile
cp dots/bash/.bashrc ~/
cp dots/bash/.bash_profile ~/

# fuzzel
sudo apt install -y fuzzel
sudo rm -rf ~/.config/fuzzel
cp -r dots/fuzzel ~/.config/

# mpv
sudo apt install -y mpv
sudo rm -rf ~/.config/mpv
cp -r dots/mpv ~/.config/

# grim, slurp, swappy for screenshots
sudo apt install -y scdoc
git clone https://github.com/jtheoof/swappy
cd swappy 
meson setup build
ninja -C build
sudo rm ~/.local/bin/swappy
cp ./build/swappy ~/.local/bin/
cd ..
sudo rm -rf ./swappy

sudo rm -rf ~/.config/swappy
cp -r dots/swappy ~/.config/

sudo apt install -y grim slurp

a hyprpaper and dependencies
sudo apt install -y libmagic-dev
git clone https://github.com/hyprwm/hyprpaper
cd hyprpaper
make all
sudo rm ~/.local/bin/hyprpaper
cp ./build/hyprpaper ~/.local/bin/
cd ..
sudo rm -rf ./hyprpaper

# hyprpicker
git clone https://github.com/hyprwm/hyprpicker
cd hyprpicker
make all
sudo rm ~/.local/bin/hyprpicker
cp ./build/hyprpicker ~/.local/bin/
cd ..
sudo rm -rf ./hyprpicker

# swayimg
sudo rm -rf ~/.config/swayimg
cp -r dots/swayimg ~/.config/

#waybar
# TODO du brauchst doch nicht alle oder???
#sudo apt install -y clang-tidy gobject-introspection libdbusmenu-gtk3-dev libevdev-dev libfmt-dev libgirepository1.0-dev libgtk-3-dev libgtkmm-3.0-dev libinput-dev libjsoncpp-dev libmpdclient-dev libnl-3-dev libnl-genl-3-dev libpulse-dev libsigc++-2.0-dev libspdlog-dev libwayland-dev scdoc upower libxkbregistry-dev 

git clone https://github.com/Alexays/Waybar
sudo rm -rf ./Waybar/meson.build
mv ./waybarfix/meson.build ./Waybar/
cd Waybar
sed -i -e 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp
meson --prefix=~/.local --buildtype=plain --auto-features=enabled --wrap-mode=nodownload build
meson configure -Dexperimental=true build
sudo ninja -C build install
cd ..
sudo rm -rf Waybar

sudo rm -rf ~/.config/waybar
cp -r dots/waybar ~/.config/

# yt-dlp
sudo apt install -y yt-dlp
sudo rm -rf ~/.config/yt-dlp
cp -r dots/yt-dlp ~/.config/

#dunst
sudo apt install -y dunst 

# pavucontrol
sudo apt install -y pavucontrol 

# wlogout
sudo apt install -y wlogout

# node and npm
sudo apt install nodejs npm

# taskwarrior
sudo apt install taskwarrior
sudo rm -rf ~/.config/task
cp -r dots/task ~/.config/

#vit
sudo apt install vit
sudo rm -rf ~/.config/task
cp -r dots/.vit ~/

# when 
sudo apt install when
sudo rm -rf ~/.when
cp -r dots/.when ~/


