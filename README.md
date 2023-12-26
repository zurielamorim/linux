Configuração de Aliases para Facilitar o Uso dos Scripts Connect e Tunel.

Para simplificar a execução dos scripts Connect e Tunnel através de aliases, siga os passos abaixo:
1 - Abra o arquivo ~/.bashrc para edição:
vi ~/.bashrc

2 - Adicione as seguintes linhas no final do arquivo:
alias connect='bash /home/zuriel-amorim/connect.sh'
alias tunnel='bash /home/zuriel-amorim/tunel.sh'

3 - Salve as alterações e feche o arquivo.

A partir de agora, você poderá utilizar os comandos connect e tunel seguidos pelos parâmetros necessários para executar os scripts correspondentes.

########################################################################################

Script de Instalação

O script instalacao.sh realiza uma série de passos para configurar e instalar diversas ferramentas no seu sistema. A seguir estão as principais ações executadas pelo script:

    Atualização de Pacotes:
        Inicialmente, o script realiza uma atualização dos pacotes do sistema para garantir que você esteja utilizando as versões mais recentes.

    Configuração do Diretório .ssh e Geração de Chaves RSA:
        Cria o diretório .ssh e gera chaves RSA para proporcionar uma camada adicional de segurança nas suas comunicações.

    Instalação de Programas:
        O script instala os seguintes programas:
            WireGuard
            Wine
            AnyDesk
            Flameshot
            Timeshift
            CopyQ
            Google Chrome
            Notepadqq

Essas instalações visam fornecer um ambiente de trabalho mais completo e funcional, abrangendo desde ferramentas de segurança até aplicativos do dia a dia.

#######################################################################################

