#! /bin/sh
VERSION=1.3.1
PLATFORM=ramips_24kec
PLATFORM=ar71xx
CHINADNS=ChinaDNS_${VERSION}_${PLATFORM}
INSTALLPATH=~/.local/chinadns

set -e

rm -rf ${INSTALLPATH} || true
mkdir -p ${INSTALLPATH}
if [ ! -e "${CHINADNS}.tar.gz" ]; then
    wget "http://downloads.sourceforge.net/project/chinadns/dist/${CHINADNS}.ipk" -O ${INSTALLPATH}/${CHINADNS}.tar.gz
fi
tar -zxf ${INSTALLPATH}/${CHINADNS}.tar.gz -C "${INSTALLPATH}"
rm ${INSTALLPATH}/${CHINADNS}.tar.gz
rm ${INSTALLPATH}/control.tar.gz
rm ${INSTALLPATH}/debian-binary
tar -zxf ${INSTALLPATH}/data.tar.gz -C "${INSTALLPATH}"
rm ${INSTALLPATH}/data.tar.gz
