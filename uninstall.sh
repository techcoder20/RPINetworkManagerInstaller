#!/bin/bash

sudo apt -y purge network-manager

#Removing Network Manager
sudo sed -i '/denyinterfaces wlan0/c\ ' /etc/dhcpcd.conf 
sudo sed -i '/[main]/,/managed=true/d' /etc/NetworkManager/NetworkManager.conf 
