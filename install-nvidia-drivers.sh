#!/bin/bash

# install nvidia drivers

sudo apt update && sudo apt upgrade
sudo apt install nvidia-driver

echo "now run the configure-nvidia script"
