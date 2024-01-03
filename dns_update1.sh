#!/bin/bash

# Caminho para o diretório atual do usuário
USER_HOME=$(eval echo ~$USER)

# Conteúdo do arquivo resolv.conf.default
RESOLV_CONTENT="# This is /run/systemd/resolve/stub-resolv.conf managed by man:systemd-resolved(8).\n\
# Do not edit.\n\
# This file might be symlinked as /etc/resolv.conf. If you're looking at\n\
# /etc/resolv.conf and seeing this text, you have followed the symlink.\n\
# ...\n\
# This is a dynamic resolv.conf file for connecting local clients to the\n\
# internal DNS stub resolver of systemd-resolved. This file lists all\n\
# configured search domains.\n\
# Run \"resolvectl status\" to see details about the uplink DNS servers\n\
# currently in use.\n\
# Third party programs should typically not access this file directly, but only\n\
# through the symlink at /etc/resolv.conf. To manage man:resolv.conf(5) in a\n\
# different way, replace this symlink by a static file or a different symlink.\n\
# See man:systemd-resolved.service(8) for details about the supported modes of\n\
# operation for /etc/resolv.conf.\n\
\n\
nameserver 127.0.0.53\n\
nameserver 8.8.8.8\n\
nameserver 172.20.70.1\n\
nameserver 208.67.222.222\n\
options edns0 trust-ad\n\
search vpn.futurotec.com.br i.futurotec.com.br futurotec.com.br"

# Criar e escrever no arquivo resolv.conf.default no diretório atual do usuário
echo -e "$RESOLV_CONTENT" > "$USER_HOME/resolv.conf.default"

# Mover resolv.conf.default para dentro de /etc/
sudo mv "$USER_HOME/resolv.conf.default" "/etc/"

# Remover o atributo imutável de /etc/resolv.conf, se existir
sudo chattr -i "/etc/resolv.conf" 2>/dev/null

# Mover o arquivo resolv.conf para o diretório atual do usuário, se existir
sudo mv "/etc/resolv.conf" "$USER_HOME" 2>/dev/null

# Renomear resolv.conf.default para resolv.conf dentro de /etc
sudo mv "/etc/resolv.conf" "/etc/resolv.conf.default" 2>/dev/null
sudo mv "/etc/resolv.conf.default" "/etc/resolv.conf"

# Alterar atributos do arquivo resolv.conf para somente leitura e imutável
sudo chattr +i "/etc/resolv.conf"

echo "Processo executado com sucesso."

