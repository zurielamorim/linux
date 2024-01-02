########################################################################################

Script instalacao.sh

O script instalacao.sh realiza uma série de passos para configurar e instalar diversas ferramentas no seu sistema. 
A seguir estão as principais ações executadas pelo script:

1-Atualização de Pacotes:
Inicialmente, o script realiza uma atualização dos pacotes do sistema para garantir que você esteja utilizando as versões mais recentes.

2-Configuração do Diretório .ssh e Geração de Chaves RSA:
Cria o diretório .ssh e gera chaves RSA para proporcionar uma camada adicional de segurança nas suas comunicações.

4-Instalação de Programas:
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

########################################################################################

Script habilitar_fone.sh

O script habilitar_fone.sh é projetado para executar comandos no kernel do GNOME, permitindo a habilitação do funcionamento do fone de ouvido P3 no ambiente Linux.

########################################################################################

Script connect.sh

O script connect.sh foi desenvolvido para otimizar o tempo de conexão via SSH em servidores. É necessário ajustar as informações de usuário e senha diretamente no script antes de utilizá-lo.


########################################################################################


Script tunel.sh

O script tunel.sh, semelhante ao script connect, requer a inserção de informações de usuário e senha diretamente no script para seu funcionamento adequado. Desenvolvido por Ramon e adaptado por Josimar, o script visa facilitar o acesso remoto a equipamentos na rede do cliente.


########################################################################################


Script dns_update.sh

O script dns_update.sh foi desenvolvido para adicionar alguns servidores DNS ao arquivo resolv.conf. Em certos casos, mesmo com o WireGuard funcionando, pode haver dificuldades de acesso ao servidor de destino. Este script ajuda a contornar esse problema ao adicionar DNS específicos para facilitar o acesso.

########################################################################################

Script up_wireguard.sh

O script up_wireguard.sh foi desenvolvido para simplificar a configuração do WireGuard. Será necessário fornecer informações específicas de usuário e IP, enviadas pela infraestrutura por e-mail, para configurar corretamente o WireGuard.

########################################################################################

Script habilitar_fone.sh

O script em foco tem como objetivo possibilitar a utilização do fone de ouvido P3 no sistema operacional Linux.

########################################################################################

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

