#!/bin/bash
#vim:ts=4:sw=4:et
uso() { echo -e "$0 [start|stop|restart]\nNecessário arquivo /etc/eoip.cfg configurado corretamente." ; exit $1 ; }
[ "$DEBUG" == "1" ] && set -x
[ "$DEBUG" == "2" ] && set -v

CFG=/etc/eoip.cfg
[ -f "$CFG" ] || uso 0
killall="/usr/bin/killall"
eoip="/usr/local/sbin/eoip"
ip="/sbin/ip"

awkPrintIniSection() { # https://www.medo64.com/2018/12/extracting-single-ini-section-via-bash/
awk -v TARGET="$1" -F ' *= *' '
  {
    if ($0 ~ /^\[.*\]$/) {
      gsub(/^\[|\]$/, "", $0)
      SECTION=$0
    } else if (($1 ~ /^[A-z]+$/) && ($2 ~ /^[[:alnum:] ./,-]+$/) && (SECTION==TARGET)) {
      print $1"=\"" $2 "\""
    }
  }
  ' "$CFG"
}

if [ "$1" == "restart" ]; then
    $0 stop ; sleep 0.1 ; $0 start

elif [ "$1" == "start" ]; then
    $eoip && sleep 0.1
    sed -n "s/^\[\([^]]\+\)]/\1/p" "$CFG" |
    while read iface ; do
        eval $(awkPrintIniSection $iface)
        if [ -n "$ifaceMtu" ]; then
            $ip link set dev $iface mtu $ifaceMtu up
        else
            echo "WARN: Seção $iface não contém informações de MTU!"
        fi
        if [ -n "$ifaceCidr" ]; then
            $ip addr add $ifaceCidr dev $iface
        fi
        if [ -n "$ifaceCidrSec" ]; then
            for ipSec in $(echo "$ifaceCidrSec" | sed 's/,/ /g') ; do
                $ip addr add $ipSec dev $iface
            done
        fi
        unset ifaceMtu ifaceCidr ifaceCidrSec ipSec
    done

elif [ "$1" == "stop" ]; then
    $killall -e $eoip 2>/dev/null

else
    uso 1
fi

exit 0

# FIM
