#!/bin/bash

# Servidores DNS desejados
DNS_SERVERS=("nameserver 8.8.8.8" "nameserver 1.1.1.1" "nameserver 172.20.70.1" "nameserver 208.67.222.222")

# Adiciona os servidores DNS ao arquivo resolv.conf
for server in "${DNS_SERVERS[@]}"; do
    grep -qF "$server" /etc/resolv.conf || echo "$server" | sudo tee -a /etc/resolv.conf
done

# Impede que o sistema sobrescreva o arquivo resolv.conf
sudo chattr +i /etc/resolv.conf

echo "Configuração DNS adicionada com sucesso ao arquivo /etc/resolv.conf e protegida contra alterações."
