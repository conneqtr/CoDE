#!/bin/sh

VIMPLUGURL=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pacman --sync --refresh
pacman --sync --sysupgrade --noconfirm # the image may have been built with cached layers ...
echo "all installed packages upgraded" # ... therefore some dependencies may be stale causing issues

groupmod --gid $DOCKERGID docker
chgrp $DOCKERGID /var/run/docker.sock
echo "### set DOCKERGID to $DOCKERGID"


chown -R $NEWUSER:users ./*

mv getpass.sh /usr/local/bin

rm -rf .*   # remove any spurious config files inherited from build environ

if [ -d dotfiles ]; then ./dotfiles/install.sh; fi;
echo "### installed config files for user '$NEWUSER'"

curl -v -fLo .vim/autoload/plug.vim  --create-dirs $VIMPLUGURL
echo "### installed vimplug"

npm install -g ungit
echo "### installed ungit"

rm -rf *
echo "### cleaned home directory"

mkdir projects
echo "### created projects directory"

chown -R $NEWUSER:users ./*
chown -R $NEWUSER:users ./.*   # make sure we get all the .files too
echo "### file ownership transferred to '$NEWUSER'"

echo "### user '$NEWUSER' initialised "


pacman --sync --refresh # belt and braces

echo "### you may now wish to update your packages - run 'pacman --sync --sysupgrade' as root"

su $NEWUSER
