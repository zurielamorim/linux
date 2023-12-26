#!/bin/bash

# Caminho do arquivo de configuração WireGuard
arquivo="/etc/wireguard/wg0.conf"

# Verificar se o usuário tem permissão de root
if [ "$EUID" -ne 0 ]; then
    echo "Este script precisa ser executado com permissões de root."
    exit 1
fi

# Solicitar ao usuário os campos necessários
read -p "Digite a chave privada (PrivateKey): " chavePrivada
read -p "Digite o endereço (Address, exemplo: 172.20.70.0/24): " endereco
read -p "Digite a chave pública (PublicKey): " chavePublica

# Preencher o restante das informações
mtu="1412"
dns="172.20.70.1"
endpoint="vpn.escallo.com.br:51840"
allowedIPs="10.252.0.0/15,172.20.0.0/16,172.20.60.0/24,172.20.65.0/24,172.20.66.0/23"
persistentKeepalive="25"

# Adicionar as configurações ao arquivo wg0.conf
echo "[Interface]" > "$arquivo"
echo "PrivateKey = $chavePrivada" >> "$arquivo"
echo "Address = $endereco" >> "$arquivo"
echo "MTU = $mtu" >> "$arquivo"
echo "DNS = $dns" >> "$arquivo"
echo "" >> "$arquivo"
echo "[Peer]" >> "$arquivo"
echo "PublicKey = $chavePublica" >> "$arquivo"
echo "Endpoint = $endpoint" >> "$arquivo"
echo "AllowedIPs = $allowedIPs" >> "$arquivo"
echo "PersistentKeepalive = $persistentKeepalive" >> "$arquivo"

# Iniciar o serviço WireGuard
systemctl start wg-quick@wg0

# Habilitar o serviço WireGuard para iniciar automaticamente com o sistema
systemctl enable wg-quick@wg0

echo "Configurações adicionadas ao arquivo $arquivo com sucesso!"
echo "Serviço WireGuard iniciado e configurado para iniciar automaticamente."
