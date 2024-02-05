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

# == GIT ==

# Instala los paquetes necesarios
sudo apt -y install git;

# Establece tu correo electrónico que aparecerá en los repositorios git
git config --global user.email 'mi-email@gmail.com';

# Establece tu nombre que aparecerá en los repositorios git
git config --global user.name 'Mi nombre';

# Establece la rama por defecto a trabajar.
# Se recomienda "master" pero puedes utilizar el que quieras.
git config --global init.defaultBranch 'master';


# == Herramientas varias ==

# Cliente PostgreSQL
sudo apt -y install postgresql-client postgresql-client-common;

# Cliente SQL múltiples protocolos
flatpak install -y flathub io.beekeeperstudio.Studio;


# == Editor de código ==

# Incrementa el número de archivos que el sistema puede monitorear.
# Requerido para editores que monitorean archivos en tiempo real como Atom y
# Visual Studio Code.
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf;
sudo sysctl -p;

# Visual Studio Code
flatpak install -y com.visualstudio.code;
# flatpak install -y io.atom.Atom;

# == NodeJS ==

# Paquetes necesarios
sudo apt -y install nodejs npm;

# Instala el gestor de versiones de nodejs
sudo npm install -g n;

# Actualiza la versión de node y npm a la última versión estable
sudo n stable;

