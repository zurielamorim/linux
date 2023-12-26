Configuração de Aliases para Facilitar o Uso dos Scripts Connect e Tunel.

Para simplificar a execução dos scripts Connect e Tunnel através de aliases, siga os passos abaixo:
1 - Abra o arquivo ~/.bashrc para edição:
vi ~/.bashrc

2 - Adicione as seguintes linhas no final do arquivo:
alias connect='bash /home/zuriel-amorim/connect.sh'
alias tunnel='bash /home/zuriel-amorim/tunel.sh'

3 - Salve as alterações e feche o arquivo.

A partir de agora, você poderá utilizar os comandos connect e tunel seguidos pelos parâmetros necessários para executar os scripts correspondentes.
