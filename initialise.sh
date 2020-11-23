#!/bin/sh


groupmod --gid $DOCKERGID docker
chgrp $DOCKERGID /var/run/docker.sock
echo "### set DOCKERGID to $DOCKERGID"


chown -R $NEWUSER:users ./*

mv getpass.sh /usr/local/bin

rm -rf .*   # remove any spurious config files inherited from build environ

if [ -d dotfiles ]; then ./dotfiles/install.sh; fi;
echo "### installed config files for user '$NEWUSER'"

rm -rf *
echo "### cleaned home directory"

mkdir projects
chown -R $NEWUSER:users ./*
echo "### created projects directory"

echo "### user '$NEWUSER' initialised "


pacman --sync --refresh

echo "### you may now wish to update your packages : run pacman --sync --sysupgrade"

su $NEWUSER
