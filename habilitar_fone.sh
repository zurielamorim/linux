#!/bin/bash

# Caminho para o arquivo alsa-base.conf
alsa_base_file="/etc/modprobe.d/alsa-base.conf"

# Remover as últimas linhas no arquivo
sudo sed -i -e '/^options snd-usb-audio/d' "$alsa_base_file"
sudo sed -i -e '/^options snd-hda-intel/d' "$alsa_base_file"

# Adicionar as novas linhas no final do arquivo
echo "options snd-usb-audio index=-2" | sudo tee -a "$alsa_base_file"
echo "options snd-hda-intel model=dell-headset-multi" | sudo tee -a "$alsa_base_file"

# Rodar comandos adicionais
echo "options snd-hda-intel dmic_detect=0" | sudo tee -a /etc/modprobe.d/alsa-base.conf
echo "blacklist snd_soc_skl" | sudo tee -a /etc/modprobe.d/blacklist.conf

# Exibir mensagem de conclusão
echo "Configurações atualizadas com sucesso! Por favor, reinicie o pc."
