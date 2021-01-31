#!/bin/bash

sudo apt update
sudo apt install network-manager network-manager-gnome

#Setting Up Network Manager
sudo apt -y install network-manager network-manager-gnome 

sudo systemctl enable network-manager &>/dev/null

sudo sed -i '/denyinterfaces wlan0/c\ ' /etc/dhcpcd.conf 
echo "denyinterfaces wlan0" | sudo tee -a /etc/dhcpcd.conf &>/dev/null

sudo sed -i '/[main]/,/managed=true/d' /etc/NetworkManager/NetworkManager.conf 
echo '''
[main]
plugins=ifupdown,keyfile
dhcp=internal

[ifupdown]
managed=true''' | sudo tee -a /etc/NetworkManager/NetworkManager.conf &>/dev/null
