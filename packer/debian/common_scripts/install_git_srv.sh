#!/bin/sh

set -e -x

username=$1
password=$2

gituser="git"
gituser_home="/home/$gituser"
gitrepo_folder="/srv/git"

apt-get install -y git

gitshell=$(command -v git-shell)
echo "$gitshell" >> /etc/shells

useradd -m -p "$password" -s "$gitshell" "$gituser"

mkdir "${gituser_home}"/.ssh && chmod 700 "${gituser_home}"/.ssh
chmod 700 "${gituser_home}"/.ssh
touch "${gituser_home}"/.ssh/authorized_keys && chmod 600 "${gituser_home}"/.ssh/authorized_keys
cat "$HOME/$username/.ssh/authorized_keys" >> "${gituser_home}"/.ssh/authorized_keys

mkdir -p ${gitrepo_folder}

cp /usr/share/doc/git/contrib/git-shell-commands "${gituser_home}" -R

chown "$gituser":"$gituser" "${gituser_home}" -R
chown "$gituser":"$gituser" "${gitrepo_folder}" -R
chmod +x "${gituser_home}"/git-shell-commands/help
chmod +x "${gituser_home}"/git-shell-commands/list
