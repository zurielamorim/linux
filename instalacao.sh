#!/bin/bash

# Função para verificar se um programa está instalado
programa_instalado() {
    dpkg -l | grep -w "$1" | awk '{print $1}' | grep -q "ii"
}

# Função para exibir mensagem de status
mostrar_mensagem() {
    echo -e "\n\e[1;34m$1\e[0m\n"
}

# Atualizar os pacotes
mostrar_mensagem "Atualizando os pacotes..."
sudo apt-get update

# Fazer upgrade dos pacotes instalados
mostrar_mensagem "Fazendo upgrade dos pacotes instalados..."
sudo apt-get upgrade -y

# Instalar notepadqq, se ainda não estiver instalado
mostrar_mensagem "Instalando Notepadqq..."
if ! programa_instalado "notepadqq"; then
    sudo apt-get install -y notepadqq
    mostrar_mensagem "Notepadqq instalado com sucesso!"
else
    mostrar_mensagem "Notepadqq já está instalado. Pulando..."
fi

# Pausa para o usuário
read -p "Pressione Enter para continuar a instalação..."

# Instalar Google Chrome, se ainda não estiver instalado
mostrar_mensagem "Instalando Google Chrome..."
if ! programa_instalado "google-chrome-stable"; then
    sudo apt-get install -y google-chrome-stable
    mostrar_mensagem "Google Chrome instalado com sucesso!"
else
    mostrar_mensagem "Google Chrome já está instalado. Pulando..."
fi

# Pausa para o usuário
read -p "Pressione Enter para continuar a instalação..."

# ... (repetir o padrão para os outros programas)

# Criar diretório ~/.ssh
mostrar_mensagem "Criando diretório ~/.ssh..."
mkdir -p ~/.ssh

# Gerar chave SSH
mostrar_mensagem "Gerando chave SSH..."
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa

# Criar arquivo 'config' e adicionar conteúdo
mostrar_mensagem "Criando arquivo 'config' para SSH..."
echo "HostKeyAlgorithms=+ssh-rsa" > ~/.ssh/config
echo "PubkeyAcceptedKeyTypes=+ssh-rsa" >> ~/.ssh/config
echo "StrictHostKeyChecking no" >> ~/.ssh/config

mostrar_mensagem "Chaves SSH configuradas com sucesso!"
