#! /bin/sh
INSTALLPATH=~/.local/chinadns
LOGPATH=/tmp
${INSTALLPATH}/usr/bin/chinadns \
    -l ${INSTALLPATH}/etc/chinadns_iplist.txt \
    -c ${INSTALLPATH}/etc/chinadns_chnroute.txt \
    -b 0.0.0.0 \
    -p 5353 \
    1> ${LOGPATH}/chinadns.log \
    2> ${LOGPATH}/chinadns.err.log &
