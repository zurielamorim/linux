#!/bin/bash

# Atualizar os pacotes
sudo apt-get update

# Fazer upgrade dos pacotes instalados
sudo apt-get upgrade -y

# Instalar programas adicionais
sudo apt-get install -y notepadqq google-chrome-stable copyq timeshift flameshot anydesk wine64 

# Criar diretório ~/.ssh
mkdir -p ~/.ssh

# Gerar chave SSH
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa

# Criar arquivo 'config' e adicionar conteúdo
echo "HostKeyAlgorithms=+ssh-rsa" > ~/.ssh/config
echo "PubkeyAcceptedKeyTypes=+ssh-rsa" >> ~/.ssh/config
echo "StrictHostKeyChecking no" >> ~/.ssh/config

echo "Chaves SSH configuradas com sucesso!"
