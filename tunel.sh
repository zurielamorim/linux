#!/bin/bash
#############################################
# Name: sshTunnel.sh
# Created by: Ramon
# Adapted by: Josimar
#############################################

user=SEUUSUARIO
localPort=$(shuf -i 9001-9998 -n 1)

function getOptionsFromUser() {
    read -p "Hostname: " hostname
    read -p "Remote IP: " remoteIp
    read -p "Remote Port: " remotePort
}

function getOptionsFromCli() {
    hostname=${1}
    remoteIp=${2}
    remotePort=${3}
}

function showHelp() {
    echo "How to use the script: [hostname] [remote_ip] [remote_port] [local_port]"
    echo "  hostname ........................................ client host"
    echo "  remote_ip ................. destination IP from remote device"
    echo "  remote_port ............ destionation port from remote device"
    echo ""
}

function protocolVerify() {
    if [ ${remotePort} == 443 ]
    then
        protocol=https
    else
        protocol=http
    fi
}

function execute() {
    cmdSsh="sshpass -p SUASENHA ssh ${user}@${hostname}.vpn-zbx.ftec.us -L ${localPort}:${remoteIp}:${remotePort} -N -q"
    cmdWebAccess="google-chrome ${protocol}://127.0.0.1:${localPort}"
    if [[ ${remotePort} == 80 || ${remotePort} == 443 ]]
    then
        echo "The SSH tunnel has been created!"
        echo "Press 'CTRL+C' to destroy the tunnel"
        echo "Redirect to web interface from remote host: ${protocol}://127.0.0.1:${localPort}"
        $cmdWebAccess > /dev/null;$cmdSsh
    else
        echo "The SSH tunnel has been created. Localport: ${localPort}!"
        echo "Press 'CTRL+C' to destroy the tunnel"
        $cmdSsh
    fi
}

#############################################

if [ "${1}" == "help" ]; then
    showHelp
    exit 1
fi

if [ ${#} -ne 3 ]; then
    showHelp
    getOptionsFromUser
    protocolVerify
else
    getOptionsFromCli ${@}
    protocolVerify
fi

execute

# END
