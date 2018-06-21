#!/bin/bash

# Update installed packages
apt-get update && apt-get -y upgrade

bash install-google-fonts.sh

# HTTPS transport
apt-get -y install apt-transport-https

# Locales
apt-get -y install locales-all

# Collabora repos
echo "deb https://collaboraoffice.com/repos/CollaboraOnline/CODE /" > /etc/apt/sources.list.d/collabora.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6CCEA47B2281732DF5D504D00C54D189F4BA284D
apt-get update

# Collabora packages
apt-get -y install loolwsd code-brand collaboraoffice5.3-dict* collaboraofficebasis5.3*

# Cleanup
rm -rf /var/lib/apt/lists/*
