#!/bin/bash

# ██╗   ██╗██████╗ ██╗   ██╗███╗   ██╗████████╗██╗   ██╗        
# ██║   ██║██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██║   ██║        
# ██║   ██║██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║        
# ██║   ██║██╔══██╗██║   ██║██║╚██╗██║   ██║   ██║   ██║        
# ╚██████╔╝██████╔╝╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝        
#  ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝         
#                                                               
#     ███████╗████████╗ █████╗ ██████╗ ████████╗███████╗██████╗ 
#     ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
#     ███████╗   ██║   ███████║██████╔╝   ██║   █████╗  ██████╔╝
#     ╚════██║   ██║   ██╔══██║██╔══██╗   ██║   ██╔══╝  ██╔══██╗
#     ███████║   ██║   ██║  ██║██║  ██║   ██║   ███████╗██║  ██║
#     ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
#                                          2023-06-01  22.04-LTS

# == Virtualización & Jail ==

# Instala las cabeceras de Linux, necesarias para cualquier servicio de
# virtualización.
sudo apt -y install linux-headers-generic;

# Docker
# Reemplazar por docker-ce si se requiere docker composer.
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg;
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;
sudo apt -y update;
sudo apt-cache policy docker-ce;
sudo apt install docker-ce;

# Virtualbox
curl https://www.virtualbox.org/download/oracle_vbox_2016.asc | gpg --dearmor > oracle_vbox_2016.gpg;
curl https://www.virtualbox.org/download/oracle_vbox.asc | gpg --dearmor > oracle_vbox.gpg;
sudo install -o root -g root -m 644 oracle_vbox_2016.gpg /etc/apt/trusted.gpg.d/;
sudo install -o root -g root -m 644 oracle_vbox.gpg /etc/apt/trusted.gpg.d/;
rm -f oracle_vbox_2016.gpg;
rm -f oracle_vbox.gpg;
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list;
sudo apt -y update;
sudo apt -y install linux-headers-$(uname -r) dkms;
sudo apt -y install virtualbox-7.0;

# Añade el usuario por defecto al grupo de usuario de Virtualbox (USB).
sudo usermod -aG vboxusers $(id -nu 1000);

