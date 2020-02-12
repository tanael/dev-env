#!/bin/sh

new_hostname=$1
old_hostname=$2

hostname "${new_hostname}"
echo "${new_hostname}" > /etc/hostname
sed -i "s?${old_hostname}?${new_hostname}?g" /etc/hosts
