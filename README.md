# debian-hyprland

This repo will install hyprland on debian stable for nvidia users. 

* install Debian Bookworm stable (no DE or WM) with the standard system utilities
* install git, clone this repo and run the next scripts
* prepare-nvidia-and-backports.sh then reboot
* make-backports.sh (you can remove swayimg backport if you want)
* hyprland-dependencies.sh
* install-hyprland.sh (after that just type "Hyprland" and Hyprland will start)
* setup-system.sh (optional)

When running the make-backports.sh file a file will open up. You just 
have to save and close it with your editor you choose.
