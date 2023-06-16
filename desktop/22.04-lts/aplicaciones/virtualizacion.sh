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

# Instala docker nativo.
# Reemplazar por docker-ce si se requiere docker composer.
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04
sudo apt -y install docker.io;

# Instalación de virtualbox
sudo apt -y install virtualbox;

# Añade el usuario por defecto al grupo de usuario de Virtualbox.
# Esto habilita el uso de hardware como los puertos USB.
sudo usermod -aG vboxusers $(id -nu 1000);

