#! /bin/sh
set -e

if [ -z $1 ]; then
    echo "Usage: addroute [CIDR]"
    exit 1
fi

PPP0='tun11'
VPNGW=$(ifconfig $PPP0 | grep -Eo "P-t-P:([0-9.]+)" | cut -d: -f2)
if echo $1 | grep '/'; then
    echo "route add -net $1 gw \$VPNGW" >> routes.sh
    route add -net $1 gw $VPNGW
else
    echo "route add -host $1 gw \$VPNGW" >> routes.sh
    route add -host $1 gw $VPNGW
fi
