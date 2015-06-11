#!/bin/sh

set -x
export PATH="/bin:/sbin:/usr/sbin:/usr/bin"

LOG='/tmp/autoopenvpn.log'
PID=$$
# EXROUTEDIR='/jffs/exroute.d'
# CUSTOM='/jffs/openvpn/custom_route.sh'
INFO="[INFO#${PID}]"
DEBUG="[DEBUG#${PID}]"
ERROR="[ERROR#${PID}]"

echo "$INFO $(date "+%d/%b/%Y:%H:%M:%S") vpnup.sh started" >> $LOG

# VPNSRV=$(nvram get vpn_client1_addr)
PPP0='tun11' #change this to tun12 if you use client 2
VPNGW=$(ifconfig $PPP0 | grep -Eo "P-t-P:([0-9.]+)" | cut -d: -f2)
# VPNUPCUSTOM='/jffs/openvpn/vpnup_custom'


OLDGW=$(nvram get wan_gateway)

if [ $OLDGW == '' ]; then
	echo "$ERROR OLDGW is empty, is the WAN disconnected?" >> $LOG
	exit 0
else
	echo "$INFO OLDGW is $OLDGW" 
fi
# remove globle vpn
# route del -net 0.0.0.0 netmask 128.0.0.0
# route del -net 128.0.0.0 netmask 128.0.0.0

echo "$INFO $(date "+%d/%b/%Y:%H:%M:%S") adding the static routes, this may take a while." >> $LOG

route del default gw $VPNGW

echo "$INFO routes added"
echo "$INFO $(date "+%d/%b/%Y:%H:%M:%S") vpnup.sh ended" >> $LOG

#kill dnsmasq
dnspid=$(ps |grep dnsmasq|sed 's/\ [a-z].*//')
dnspid=$(echo $dnspid |sed 's/\ .*//')
kill $dnspid

