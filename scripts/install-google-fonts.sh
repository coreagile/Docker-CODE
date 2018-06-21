#!/bin/bash

# Original snippet by Keefer Rourke at <https://gist.github.com/keeferrourke/d29bf364bd292c78cf774a5c37a791db>
# Based on AUR package <https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ttf-google-fonts-git>
# Updated for Docker by Stephen Starkey <https://calmabiding.me>

# dependencies: fonts-cantarell, ttf-ubuntu-font-family, git
apt-get -y install fonts-cantarell ttf-ubuntu-font-family git
srcdir="/tmp/google-fonts"
pkgdir="/usr/share/fonts/truetype/google-fonts"
giturl="git://github.com/google/fonts.git"

echo "Installing Google fonts..."

mkdir $srcdir
cd $srcdir
git clone $giturl

mkdir -p $pkgdir
find $srcdir -type f -name "*.ttf" -exec install -Dm644 {} $pkgdir \;

echo "Cleaning up..."
find $pkgdir -type f -name "Cantarell-*.tff" -exec rm -f '{}' \;
find $pkgdir -type f -name "Ubuntu-*.tff" -exec rm -f '{}' \;

# google fonts provide roboto
apt-get -y --purge remove fonts-roboto git

# git is a beast
apt-get -y --purge autoremove

echo "Updating font-cache..."
fc-cache -f > /dev/null

echo "Done!"
