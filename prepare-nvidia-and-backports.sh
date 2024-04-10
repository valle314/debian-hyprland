#!/bin/bash

sudo rm /etc/apt/sources.list
sudo cp -r ./sources.list /etc/apt/
sudo apt update
sudo apt upgrade
sudo apt install nvidia-driver

echo "updating config for nvidia"
sudo mkdir -p /etc/default/
sudo mkdir -p /boot/grub/
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet loglevel=2 nvidia_drm.modeset=1"/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

