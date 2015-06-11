#! /bin/sh
VERSION=1.3.1
PLATFORM=ramips_24kec
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
#wget "http://raw.githubusercontent.com/philiptzou/tomato-scripts/master/chinadns/chinadns" -O ${INSTALLPATH}/chinadns
wget "http://7xjo43.com1.z0.glb.clouddn.com/chinadns.gz" -O ${INSTALLPATH}/chinadns.gz
gzip -d ${INSTALLPATH}/chinadns.gz
mv ${INSTALLPATH}/chinadns ${INSTALLPATH}/usr/bin/chinadns
chmod +x ${INSTALLPATH}/usr/bin/chinadns
