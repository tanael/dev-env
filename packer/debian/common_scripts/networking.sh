#!/bin/sh

set -e -x

cat << END >> /etc/network/interfaces

# vagrant
allow-hotplug ens5
iface ens5 inet dhcp

allow-hotplug ens6
iface ens6 inet dhcp
END
