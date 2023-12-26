#!/bin/bash
hostname=$1
specificHostname=$2
user= SEU USUARIO
sufix=.vpn.ftec.us
parametersNumber=${#}

function connect () {
        if [ ${parametersNumber=} == 2 ]
        then
                sshpass -p SUASENHA ssh ${user}@${hostname}.vpn-${specificHostname}.ftec.us
        else
                sshpass -p SUASENHA ssh ${user}@${hostname}${sufix}
        fi

}

connect 
