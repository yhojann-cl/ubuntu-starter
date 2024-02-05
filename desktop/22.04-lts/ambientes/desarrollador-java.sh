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

# Cliente Sqlite
apt -y install -y sqlite3;

# Cliente PostgreSQL
sudo apt -y install postgresql-client postgresql-client-common;

# Cliente SQL múltiples protocolos
flatpak install flathub io.beekeeperstudio.Studio;


# == Editor de código ==

# Incrementa el número de archivos que el sistema puede monitorear.
# Requerido para editores que monitorean archivos en tiempo real como Atom y
# Visual Studio Code.
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf;
sudo sysctl -p;

# Visual Studio Code
flatpak install -y com.visualstudio.code;
# flatpak install -y io.atom.Atom;

# == Java ==

# Define la versión de Java a utilizar
SETUP_JAVA_VERSION=17;

# Instalación de paquetes necesarios
# Incluye rutinas de ejecución y SDK para desarrollo
sudo apt -y install \
  ca-certificates-java \
  openjdk-$SETUP_JAVA_VERSION-jdk \
  openjdk-$SETUP_JAVA_VERSION-jdk-headless \
  openjdk-$SETUP_JAVA_VERSION-jre \
  openjdk-$SETUP_JAVA_VERSION-jre-headless;


# == JHipster ==

# Paquetes necesarios
sudo apt -y install nodejs npm;

# Instala el gestor de versiones de nodejs
sudo npm install -g n;

# Actualiza la versión de node y npm a la última versión estable
sudo n stable;

# Instala JHipster
sudo npm install -g generator-jhipster;

