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

# == Preparación básica ==

# Actualización básica del sistema y del repositorio.
# Algunos paquetes pueden no aparecer disponibles hasta después de actualizar.

# Actualiza el índice de paquetes
sudo apt -y update;

# Actualiza los paquetes
sudo apt -y upgrade;

# Instala todas las dependencias pendientes
sudo apt -y install -f;

# Elimina los paquetes que no se están utilizando
sudo apt -y autoremove;

# Elimina los archivos descargados por pat que no se están utilizando
sudo apt -y autoclean;


# == Configuración inicial ==

# Instala el editor de terminal por defecto.
# vim es mejor pero es mucho más complicado.
sudo apt -y install nano;

# Establece nano como editor de terminal por defecto (reemplaza al editor vi)
echo '
export EDITOR=nano;
export VISUAL=nano;
' >> ~/.bashrc;

# Aplica los cambios sin tener que volver a iniciar sesión en el terminal
export VISUAL=nano;
export EDITOR=nano;

# Paquetes necesarios para la compilación de algunas herramientas
sudo apt -y install perl cmake automake;


# == Interfaz de gnome ==

  ## == Barra superior del sistema ==

  # Muestra la fecha en la barra superior del sistema
  gsettings set org.gnome.desktop.interface clock-show-date true;

  # Muestra el día de la semana en la barra superior del sistema
  gsettings set org.gnome.desktop.interface clock-show-weekday true;

  # Muestra los segundos en la barra superior del sistema
  gsettings set org.gnome.desktop.interface clock-show-seconds true;

  # Muestra archivos ocultos
  gsettings set org.gtk.Settings.FileChooser show-hidden true;

  # Oculta unidades montadas en el dock lateral
  gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false;

  # Muestra el dock en todos los monitores
  gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true;

  # Deshabilita el bloqueo de pantalla automático
  # Si es una estación de trabajo corporativa no se recomienda.
  gsettings set org.gnome.desktop.screensaver lock-enabled false;
  gsettings set org.gnome.desktop.screensaver idle-activation-enabled false;
  gsettings set org.gnome.desktop.session idle-delay 0;

  
  ## == Configuraciones para Gnome Terminal ==
  
  # Obtiene la ruta de gconf para el perfil por defecto de Gnome Terminal
  GS_GNOME_TERMINAL_P=$(echo "
    org.gnome.Terminal.Legacy.Profile:
    /org/gnome/terminal/legacy/profiles:
    $(
      gsettings get org.gnome.Terminal.ProfilesList default | \
      awk -F \' '{print $2}'
    )/
  " | awk '{printf $0}' | sed 's/ //g');

  # Deshabilita el sonido del terminal
  gsettings set "${GS_GNOME_TERMINAL_P}" audible-bell false;
 
  # Establece el nombre del perfil por defecto
  gsettings set "${GS_GNOME_TERMINAL_P}" visible-name 'Profile';

  # Deshabilita el uso de la paleta de colores del sistema
  gsettings set "${GS_GNOME_TERMINAL_P}" use-theme-colors false;
  
  # Establece el color de fondo
  gsettings set "${GS_GNOME_TERMINAL_P}" background-color 'rgb(38,38,38)';

  # Deshabilita la transparencia de fondo
  gsettings set "${GS_GNOME_TERMINAL_P}" use-transparent-background false;

  # Establece los colores del texto
  gsettings set "${GS_GNOME_TERMINAL_P}" foreground-color 'rgb(238,255,222)';

  # Habilita las letras resaltadas en negritas
  gsettings set "${GS_GNOME_TERMINAL_P}" bold-is-bright true;

  # Establece la separación entre caracteres
  gsettings set "${GS_GNOME_TERMINAL_P}" cell-height-scale 1.0;
  gsettings set "${GS_GNOME_TERMINAL_P}" cell-width-scale 1.0;

  # Establece la paleta de colores
  gsettings set "${GS_GNOME_TERMINAL_P}" palette $(echo "
    [
      'rgb(46,52,54)',
      'rgb(204,0,0)',
      'rgb(247,81,2)',
      'rgb(196,160,0)',
      'rgb(52,101,164)',
      'rgb(80,96,123)',
      'rgb(6,152,154)',
      'rgb(211,215,207)',
      'rgb(85,87,83)',
      'rgb(238,255,222)',
      'rgb(255,72,6)',
      'rgb(252,233,79)',
      'rgb(186,230,139)',
      'rgb(238,255,222)',
      'rgb( 52,226,226)',
      'rgb(236,238,238)'
    ]
  " | awk '{printf $0}' | sed 's/ //g');

  # Aumenta el historial en pantalla (scroll vertical)
  gsettings set "${GS_GNOME_TERMINAL_P}" scrollback-lines 1000000;

  # Elimina la variable del identificador del perfil por defecto
  unset GS_GNOME_TERMINAL_P;


# == Configuraciones de Ubuntu ==

# Deshabilita las noticias (spam) de apt
sudo pro config set apt_news=false;

  # == Eliminación de paquetes problemáticos ==

  # Elimina el nefasto Snap Store.
  # Ahorra recursos, bloqueos de IO, uso de memoria, CPU, etc.
  sudo snap remove snap-store;
  sudo apt remove snap-store;
  
  # Elimina Gnome Software (el intento previo a Snap Store)
  sudo apt remove gnome-software;
  sudo apt autoremove;
  sudo apt autoclean;
  
  # Si iotop indica un uso desmedido de rsyslog, unos 10gb de ram, 50% de uso de
  # CPU y un boqueo casi completo del disco duro, nautilus se bloquea y se
  # cierra solo, significa que probablemente tengas el problema de
  # tracker miner sin solución hasta el momento:
  # https://gitlab.gnome.org/GNOME/tracker/-/issues/58
  # https://gitlab.gnome.org/GNOME/tracker/-/issues/342
  # No deshabilitar el servicio a menos que tengas dichos síntomas.
  
  # Deshabilita el servicio tracker-miner
  sudo systemctl --user mask \
    tracker-extract-3.service \
    tracker-miner-fs-3.service \
    tracker-miner-rss-3.service \
    tracker-writeback-3.service \
    tracker-xdg-portal-3.service \
    tracker-miner-fs-control-3.service;
  
  # Aplica los cambios y detiene el proceso
  tracker3 reset -s -r;
  
  # Se recomienda reiniciar el equipo.


  # == Reemplazo del splash de ubuntu por verbose text ==
  
  # Aplica el cambio en el archivo de configuraciones de arranque de grub2
  # De esta manera si se produce algún error o complicaicón al momento de
  # arrancar el sistema, se podrá observar claramente el origen del defecto.
  sudo sed -i \
    "s/\(GRUB_CMDLINE_LINUX_DEFAULT *= *\).*/\1\"text\"/" \
    /etc/default/grub;
  
  # Aplica los cambios de arranque
  sudo update-grub2;
  

# == Instalación y configuración de OpenSSH ==

# Instalación del paquete
sudo apt -y install openssh-server;

# Generación de llaves por defecto para acceso remoto
# También es necesario para todo tipo de acceso vía SSH
# como por ejemplo, utilizar repositorios git.
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa;

# Configuraciones de usuario por defecto
sudo echo '
# Permite la autenticación como root (administración)
PermitRootLogin yes

# Permite el acceso a traves del uso de llaves RSA de SSH
PubkeyAuthentication yes

# Deshabilita el acceso remoto por contraseña
# Evita ataques de fuerza bruta (CWE-307)
PasswordAuthentication no

# Deshabilita por defecto accesos no utilizados
# Aumenta la velocidad de autenticación
KerberosAuthentication no
GSSAPIAuthentication no

# Deshabilita la generación de ventanas en equipos remotos
X11Forwarding no

# Deshabilita la traducción DNS de las direcciones remotas
# Aumenta la velocidad de autenticación
UseDNS no
' > /etc/ssh/sshd_config.d/user.conf;

# Aplica los cambios de las configuraciones reiniciando el servicio
sudo systemctl restart sshd;


# == Logging ==

# Reduce la creación de respaldos de logs en /var/logs.
# Aumenta espacio en disco y disminuye el bloqueo de IO.
# Se desaconseja en servidores ya que disminuye la posibilidad de realizar
# auditorías.

sudo echo '
/var/log/syslog
/var/log/mail.info
/var/log/mail.warn
/var/log/mail.err
/var/log/mail.log
/var/log/daemon.log
/var/log/kern.log
/var/log/auth.log
/var/log/user.log
/var/log/lpr.log
/var/log/cron.log
/var/log/debug
/var/log/messages
{
  rotate 0
  monthly
  missingok
  notifempty
  nocompress
  sharedscripts
  postrotate
    /usr/lib/rsyslog/rsyslog-rotate
  endscript
}
' > /etc/logrotate.d/rsyslog;

sudo echo '
/var/log/apt/term.log {
  rotate 0
  monthly
  nocompress
  missingok
  notifempty
}

/var/log/apt/history.log {
  rotate 0
  monthly
  nocompress
  missingok
  notifempty
}
' > /etc/logrotate.d/apt;

sudo echo '
/var/log/alternatives.log {
  monthly
  rotate 12
  compress
  delaycompress
  missingok
  notifempty
  create 644 root root
}
' > /etc/logrotate.d/alternatives;

sudo echo '
/var/log/apport.log {
  weekly
  rotate 0
  delaycompress
  nocompress
  notifempty
  missingok
}
' > /etc/logrotate.d/apport;

sudo echo '
/var/log/dpkg.log {
  monthly
  rotate 0
  nocompress
  delaycompress
  missingok
  notifempty
  create 644 root root
}
' > /etc/logrotate.d/dpkg;


# == Herramientas varias ==

# Paquetes básicos no libres (fuentes de texto, sistemas de compresión, etc)
sudo apt -y install ubuntu-restricted-extras;

# Compresión básico
sudo apt -y install rar p7zip gzip;

# Monitoreo básico de uso de hardware
sudo apt -y install htop iotop;

# Monitor gráfico de temperatura de todo el hardware
sudo sudo apt -y install psensor;

# Conectividad y clientes
sudo apt -y install links whois curl wget;

# Herramientas de disco
sudo apt -y install gparted;

# Herramientas para terminal
sudo apt -y install tree tmux;

# Herramientas de red
sudo apt -y install whois net-tools traceroute;

# Compatibilidad con discos ntfs y otros
sudo apt -y install exfat-fuse exfat-utils;

# Fuentes de texto básicos y suavizadores importantes
sudo apt -y install ttf-ancient-fonts lcdf-typetools;

# Conversión básica de archivos
sudo apt -y install ffmpeg graphicsmagick-imagemagick-compat;

  
# == Tiempo y zona horaria ==

# Instala el servicio de NTP
sudo apt -y install ntp ntpdate;

# Indica el servidor desde donde sincronizar
sudo echo 'server ntp.shoa.cl' >> /etc/ntp.conf;

# Establece la zona horaria
sudo timedatectl set-timezone America/Santiago

# Inicia el servicio NTP
systemctl enable ntp;
systemctl restart ntp;

# Sincroniza el servidor NTP
ntpd -gq;

# Testea la hora y fecha actual sincronizada
date;


# == Flatpak ==

# En todo sistema GNU/Linux se recomienda hacer uso de Flatpak en ves de apt o
# snap, debido a que la gran mayoría de las aplicaciones de snap son inestables
# y tienen problemas de jaula, muchos no pueden hacer uso de archivos en discos
# externos, hay conflictos con el template del sistema, uso de fuentes
# tipográficas personalizadas y similares. Tampoco hay muchas opciones reportar
# dichos problemas, el soporte es muy pobre, algunos problemas básicos llevan
# años sin resolverse.
# Flatpak permite descargar e instalar paquetes preconfigurados para que estos
# se ejecuten sin problemas de dependencias en cualquier distribución por igual.

# Agrega el repositorio al gestor de apt
sudo add-apt-repository -y ppa:flatpak/stable;

# Instala Flatpak
sudo apt -y install flatpak;

# Nota importante: NO se recomienda instalar gnome-software-plugin-flatpak
# debido al uso desmesurado de recursos al momento de requerir actualizaciones.

# Agrega el repositorio remoto oficial de flathub
sudo flatpak remote-add --if-not-exists flathub \
  https://flathub.org/repo/flathub.flatpakrepo;

# Se recomienda reiniciar el equipo.


# == Aplicaciones recomendadas ==

# Dependiendo del uso del equipo se recomiendan las siguientes aplicaciones:

# Google Chrome Stable
flatpak install -y com.google.Chrome;

# Mozilla Firefox
sudo snap remove firefox; # Elimina la versión obsoleta instalada por defecto
flatpak install -y org.mozilla.firefox; # Instala la última versión estable

# Ofimática WPS Office
flatpak install -y com.wps.Office;

# Lector RSS Fluent
flatpak install -y me.hyliu.fluentreader;

# Cliente para escritorio remoto multiprotocolo
flatpak install -y org.remmina.Remmina;

# Reproductor de contenido media (audio y video)
flatpak install -y org.videolan.VLC;

# Gestor de filtros de audio para pulseaudio
flatpak install -y com.github.wwmm.pulseeffects;

# Gestor de filtros de audio para pipewire (wayland)
# flatpak install -y com.github.wwmm.easyeffects;
