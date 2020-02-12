#!/bin/sh

set -e -x

export DEBIAN_FRONTEND=noninteractive

cat << EOF > /etc/apt/sources.list

deb http://ftp.se.debian.org/debian testing main non-free contrib
deb-src http://ftp.se.debian.org/debian testing main non-free contrib

deb http://security.debian.org testing-security main contrib non-free
deb-src http://security.debian.org testing-security main contrib non-free

deb http://ftp.se.debian.org/debian testing-updates main contrib non-free
deb-src http://ftp.se.debian.org/debian testing-updates main contrib non-free

EOF

apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove

