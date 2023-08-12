#!/bin/bash

#update config
echo "updating config for nvidia"

#sudo touch /etc/mkinitcpio.conf
#sudo sed -i 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
#sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img
echo "options nvidia-drm modeset=1" | sudo tee -a /etc/modprobe.d/nvidia.conf

sudo mkdir -p /etc/default/
sudo mkdir -p /boot/grub/
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia_drm.modeset=1"/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

