#!/bin/bash

sudo apt install -y packaging-dev debian-keyring devscripts equivs

mkdir ./${1}-backports
cd ./${1}-backports

sudo apt source ${1}/testing 
cd */
sudo mk-build-deps --install --remove
sudo dch --bpo
sudo dpkg-buildpackage --build=binary --unsigned-changes

cd ..
cd ..
