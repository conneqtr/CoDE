#!/bin/bash

mv /home/$NEWUSER/dotfiles/dot.bashrc /home/$NEWUSER/.bashrc
mv /home/$NEWUSER/dotfiles/dot.config /home/$NEWUSER/.config
mv /home/$NEWUSER/dotfiles/dot.finder /home/$NEWUSER/.finder
mv /home/$NEWUSER/dotfiles/dot.vim /home/$NEWUSER/.vim 
mv /home/$NEWUSER/dotfiles/dot.gitconfig /home/$NEWUSER/.gitconfig
mv /home/$NEWUSER/dotfiles/dot.tmux /home/$NEWUSER/.tmux 
mv /home/$NEWUSER/dotfiles/dot.tmux.conf.local /home/$NEWUSER/dot.tmux.conf.local 

cd /home/$NEWUSER/
ln -s /home/$NEWUSER/.tmux/.tmux.conf
