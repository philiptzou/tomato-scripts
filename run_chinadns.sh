#! /bin/sh
INSTALLPATH=~/.local/chinadns
LOGPATH=/tmp
${INSTALLPATH}/usr/bin/chinadns \
    -l ${INSTALLPATH}/etc/chinadns_iplist.txt \
    -c ${INSTALLPATH}/etc/chinadns_chnroute.txt \
    -s 202.106.46.151,202.106.195.68,223.5.5.5,208.67.222.222:443,8.8.8.8 \
    -b 0.0.0.0 \
    -p 5353 \
    1> ${LOGPATH}/chinadns.log \
    2> ${LOGPATH}/chinadns.err.log &
