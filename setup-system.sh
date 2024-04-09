#!/bin/bash

# user dirs
mkdir -p ~/.local/bin
cp -r scripts ~/.local/

sudo apt install --no-install-recommends -y imagemagick
scripts/change-default-hyprland-backgrounds.sh

sudo rm -rf ~/.config/mimeapps.list
cp -r home_dots/.config/mimeapps.list ~/.config/

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

# for neovim sessions
mkdir -p ~/dev/sessions

# ranger
echo "----------------------------------------------------------------------------ranger----------------------------------------------------------------------------"
sudo apt install -y udiskie 
sudo apt install --no-install-recommends -y fzf unzip zip tar fd-find ranger
mkdir -p ~/.local/share/trash

# dragon
echo "----------------------------------------------------------------------------dragon----------------------------------------------------------------------------"
git clone https://github.com/mwh/dragon
cd dragon
make 
sudo rm ~/.local/bin/dragon
cp ./dragon ~/.local/bin/
cd ..
sudo rm -rf ./dragon

## get some dependencies for neovim plugins
echo "----------------------------------------------------------------------------neovim----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y ripgrep latexmk wl-clipboard python3-pynvim curl

git clone https://github.com/neovim/neovim --branch v0.9.5 --single-branch --depth 1
cd neovim
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=~/.local
make install
cd ..
sudo rm -rf ./neovim

# sioyek
echo "----------------------------------------------------------------------------sioyek----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y sioyek

# fuzzel
echo "----------------------------------------------------------------------------fuzzel----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y fuzzel

# mpv
echo "----------------------------------------------------------------------------mpv----------------------------------------------------------------------------"
sudo apt install -y ffmpeg libavfilter-dev libass-dev libmpv-dev
git clone https://github.com/mpv-player/mpv --branch v0.37.0 --single-branch --depth 1
cd ./mpv
mkdir -p subprojects
git clone https://code.videolan.org/videolan/libplacebo --branch v6.338 --single-branch --depth 1 --recursive subprojects/libplacebo
meson setup build --default-library=static
meson compile -C build
cp ./build/mpv ~/.local/bin
cd ..

sudo rm -rf ~/.local/share/applications/mpv.desktop 
mkdir -p ~/.local/share/applications/
touch ~/.local/share/applications/mpv.desktop
cat <<EOT >> ~/.local/share/applications/mpv.desktop
[Desktop Entry]
Type=Application
Name=mpv Media Player
Exec=mpv --player-operation-mode=pseudo-gui -- %U
Terminal=false
Categories=AudioVideo;Audio;Video;Player;TV;
MimeType=application/ogg;application/x-ogg;application/mxf;application/sdp;application/smil;application/x-smil;application/streamingmedia;application/x-streamingmedia;application/vnd.rn-realmedia;application/vnd.rn-realmedia-vbr;audio/aac;audio/x-aac;audio/vnd.dolby.heaac.1;audio/vnd.dolby.heaac.2;audio/aiff;audio/x-aiff;audio/m4a;audio/x-m4a;application/x-extension-m4a;audio/mp1;audio/x-mp1;audio/mp2;audio/x-mp2;audio/mp3;audio/x-mp3;audio/mpeg;audio/mpeg2;audio/mpeg3;audio/mpegurl;audio/x-mpegurl;audio/mpg;audio/x-mpg;audio/rn-mpeg;audio/musepack;audio/x-musepack;audio/ogg;audio/scpls;audio/x-scpls;audio/vnd.rn-realaudio;audio/wav;audio/x-pn-wav;audio/x-pn-windows-pcm;audio/x-realaudio;audio/x-pn-realaudio;audio/x-ms-wma;audio/x-pls;audio/x-wav;video/mpeg;video/x-mpeg2;video/x-mpeg3;video/mp4v-es;video/x-m4v;video/mp4;application/x-extension-mp4;video/divx;video/vnd.divx;video/msvideo;video/x-msvideo;video/ogg;video/quicktime;video/vnd.rn-realvideo;video/x-ms-afs;video/x-ms-asf;audio/x-ms-asf;application/vnd.ms-asf;video/x-ms-wmv;video/x-ms-wmx;video/x-ms-wvxvideo;video/x-avi;video/avi;video/x-flic;video/fli;video/x-flc;video/flv;video/x-flv;video/x-theora;video/x-theora+ogg;video/x-matroska;video/mkv;audio/x-matroska;application/x-matroska;video/webm;audio/webm;audio/vorbis;audio/x-vorbis;audio/x-vorbis+ogg;video/x-ogm;video/x-ogm+ogg;application/x-ogm;application/x-ogm-audio;application/x-ogm-video;application/x-shorten;audio/x-shorten;audio/x-ape;audio/x-wavpack;audio/x-tta;audio/AMR;audio/ac3;audio/eac3;audio/amr-wb;video/mp2t;audio/flac;audio/mp4;application/x-mpegurl;video/vnd.mpegurl;application/vnd.apple.mpegurl;audio/x-pn-au;video/3gp;video/3gpp;video/3gpp2;audio/3gpp;audio/3gpp2;video/dv;audio/dv;audio/opus;audio/vnd.dts;audio/vnd.dts.hd;audio/x-adpcm;application/x-cue;audio/m3u;
StartupWMClass=mpv
EOT

sudo rm -rf ./mpv


# grim, slurp, swappy for screenshots
echo "----------------------------------------------------------------------------grim, slurp, swappy for screenshots----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y scdoc
git clone https://github.com/jtheoof/swappy --branch v1.5.1 --single-branch
cd swappy 
meson setup build
ninja -C build
sudo rm ~/.local/bin/swappy
cp ./build/swappy ~/.local/bin/
cd ..
sudo rm -rf ./swappy

sudo apt install --no-install-recommends -y grim slurp

a hyprpaper and dependencies
sudo apt install --no-install-recommends -y libmagic-dev
git clone https://github.com/hyprwm/hyprpaper --branch v0.4.0 --single-branch
cd hyprpaper
make all
sudo rm ~/.local/bin/hyprpaper
cp ./build/hyprpaper ~/.local/bin/
cd ..
sudo rm -rf ./hyprpaper

# hyprpicker
echo "----------------------------------------------------------------------------hyprpicker----------------------------------------------------------------------------"
git clone https://github.com/hyprwm/hyprpicker --branch v0.1.1 --single-branch
cd hyprpicker
make all
sudo rm ~/.local/bin/hyprpicker
cp ./build/hyprpicker ~/.local/bin/
cd ..
sudo rm -rf ./hyprpicker

# swayimg
echo "----------------------------------------------------------------------------swayimg(config)----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y libjson-c-dev

git clone https://github.com/artemsen/swayimg --branch v2.2 --single-branch --depth 1
cd ./swayimg
meson setup build --default-library=static --buildtype=release 
meson compile -C build
cp ./build/swayimg ~/.local/bin
cd ..

sudo rm -rf ./swayimg

# waybar
echo "----------------------------------------------------------------------------waybar(ERROR EXPECTED at the end because non root install)----------------------------------------------------------------------------"
# sudo apt install --no-install-recommends -y clang-tidy gobject-introspection libdbusmenu-gtk3-dev libevdev-dev libfmt-dev libgirepository1.0-dev libgtk-3-dev libgtkmm-3.0-dev libinput-dev libjsoncpp-dev libmpdclient-dev libnl-3-dev libnl-genl-3-dev libpulse-dev libsigc++-2.0-dev libspdlog-dev libwayland-dev scdoc upower libxkbregistry-dev libupower-glib-dev libwireplumber-0.4-dev libsndio-dev libgtk-layer-shell-dev libplayerctl-dev libjack-dev libhdate-dev
git clone https://github.com/Alexays/Waybar --branch 0.10.0 --single-branch --recursive --depth 1
cd Waybar
meson setup build --default-library=static --buildtype=release -Dexperimental=true
meson compile -C build
cp ./build/waybar ~/.local/bin
cd ..
sudo rm -rf ./Waybar

# yt-dlp
echo "----------------------------------------------------------------------------yt-dlp----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y ffmpeg 
git clone https://github.com/yt-dlp/yt-dlp --branch 2023.10.13 --single-branch --depth 1
cd ./yt-dlp
make yt-dlp
mv ./yt-dlp ~/.local/bin/yt-dlp
cd ..
sudo rm -rf ./yt-dlp

sudo rm -rf ~/.config/yt-dlp
cp -r dots/yt-dlp ~/.config/

# dunst and authentication Agent
echo "----------------------------------------------------------------------------dunst and authentication Agent----------------------------------------------------------------------------"
sudo apt install -y dunst polkit-kde-agent-1 

# pavucontrol
echo "----------------------------------------------------------------------------pavucontrol----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y pavucontrol 

# node and npm
echo "----------------------------------------------------------------------------node and npm----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y nodejs npm

# taskwarrior
echo "----------------------------------------------------------------------------taskwarrior----------------------------------------------------------------------------"
sudo apt install --no-install-recommends taskwarrior
sudo rm -rf ~/.config/task
mkdir -p ~/.local/share/task/.task
cp -r dots/task ~/.config/

# vit
echo "----------------------------------------------------------------------------vit----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y vit
sudo rm -rf ~/.vit
cp -r dots/.vit ~/

# when 
echo "----------------------------------------------------------------------------when----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y when
sudo rm -rf ~/.when
cp -r dots/.when ~/

# firefox
echo "----------------------------------------------------------------------------firefox----------------------------------------------------------------------------"
curl 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/116.0.2/linux-x86_64/en-US/firefox-116.0.2.tar.bz2' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate, br' -H 'Referer: https://www.mozilla.org/' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: cross-site' -o firefox.tar.bz2
tar -xjf ./firefox.tar.bz2
sudo rm -rf ./firefox.tar.bz2
mv ./firefox ~/.local/share/ 
sudo rm ~/.local/share/applications/firefox-stable.desktop
mkdir -p ~/.local/share/applications/
touch ~/.local/share/applications/firefox-stable.desktop
cat <<EOT >> ~/.local/share/applications/firefox-stable.desktop
[Desktop Entry]
Name=Firefox Stable
Comment=Web Browser
Exec=${HOME}/.local/share/firefox/firefox %u
Terminal=false
Type=Application
Icon=${HOME}/.local/share/firefox/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Actions=Private;

[Desktop Action Private]
Exec=${HOME}/.local/share/firefox/firefox --private-window %u
Name=Open in private mode
EOT

# to make firefox work..
sudo apt install --no-install-recommends -y libdbus-glib-1-2 

# pipewire, wireplumber and qt5/6 for obs and xdg desktop portal hyprland
echo "----------------------------------------------------------------------------xdg-desktop-portal-hyprland----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y libpipewire-0.3-0 libpipewire-0.3-dev libpipewire-0.3-modules libwireplumber-0.4-0 libwireplumber-0.4-dev pipewire-bin pipewire-pulse pipewire wireless-tools wireplumber libinih-dev libsystemd-dev qtbase5-dev qtdeclarative5-dev qt6-base-dev
sudo apt install -y rtkit qt6-wayland

git clone https://github.com/hyprwm/xdg-desktop-portal-hyprland --branch v0.5.0 --single-branch
cd xdg-desktop-portal-hyprland
meson build --prefix=/usr
ninja -C build
cd hyprland-share-picker && make all && cd ..
sudo ninja -C build install
sudo cp ./hyprland-share-picker/build/hyprland-share-picker /usr/bin
cd ..
sudo rm -rf ./xdg-desktop-portal-hyprland
sudo apt install --no-install-recommends -y xdg-desktop-portal

# hyprprop
echo "----------------------------------------------------------------------------hyprprop----------------------------------------------------------------------------"
git clone https://github.com/vilari-mickopf/hyprprop
cp ./hyprprop/hyprprop ~/.local/bin/
sudo rm -rf ./hyprprop

# keepassx 
echo "----------------------------------------------------------------------------keepassx----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y keepassx
sudo rm -rf ~/.config/keepassxc
cp -r dots/keepassxc ~/.config/

# qrcp
echo "----------------------------------------------------------------------------qrcp----------------------------------------------------------------------------"
mkdir ./qrcp
cd ./qrcp
wget https://github.com/claudiodangelis/qrcp/releases/download/0.10.1/qrcp_0.10.1_linux_x86_64.tar.gz 
tar xf qrcp_0.10.1_linux_x86_64.tar.gz
sudo chmod +x qrcp
mv ./qrcp ~/.local/bin/
cd ..
sudo rm -rf ./qrcp

echo "----------------------------------------------------------------------------latex packages----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y texlive-base texlive-lang-german texlive-latex-extra texlive-science texlive-extra-utils

echo "----------------------------------------------------------------------------installing some utilities----------------------------------------------------------------------------"
sudo apt install --no-install-recommends -y calc translate-shell tldr ghostscript tesseract-ocr tesseract-ocr-deu libsixel-bin

echo "logout or reboot system"
