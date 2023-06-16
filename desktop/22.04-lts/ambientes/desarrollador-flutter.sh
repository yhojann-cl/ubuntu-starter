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


# == Editor de código ==

# Incrementa el número de archivos que el sistema puede monitorear.
# Requerido para editores que monitorean archivos en tiempo real como Atom y
# Visual Studio Code.
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf;
sudo sysctl -p;

# Visual Studio Code
flatpak install -y com.visualstudio.code;


# == Flutter ==

# Paquetes necesarios
sudo apt -y install cmake ninja-build clang libgtk-3-dev;

# Lamentablemente aun no hay un paquete vía apt o flatpak
sudo snap install flutter --classic;

# Actualiza flutter
flutter upgrade;

# Realiza un precaché de los paquetes en repositorio
flutter precache;

# Habilita la compilación y despliegue en ambiente de desarrollo para Linux
flutter config --enable-linux-desktop;


# == Creando un proyecto ==

# Crea un proyecto
flutter create nombre-de-la-app;

# Ejecutar un proyecto en ambiente de desarrollo
cd nombre-de-la-app/;
flutter run;

