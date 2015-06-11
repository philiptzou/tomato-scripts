#!/bin/sh
set -e
cd /tmp/home/root
tar zcf openvpn.tar.gz openvpn
ls /jffs/openvpn.tar.gz -la
cp openvpn.tar.gz /jffs/
ls /jffs/openvpn.tar.gz -la
