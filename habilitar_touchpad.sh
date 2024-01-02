#!/bin/bash

# Desativa o módulo do psmouse
sudo modprobe -r psmouse

# Ativa o módulo do psmouse com o parâmetro proto=imps
sudo modprobe psmouse proto=imps

echo "O módulo psmouse foi atualizado com sucesso."

echo "Por favor, reinicie o computador para que as mudanças tenham efeito."
