#!/bin/sh

set -e -x

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove

for pkg in curl make build-essential haveged; do
  apt-get install $pkg -y
done

