#!/usr/bin/sh
# Defining the shell path and global variables
SHELL_PATH=$(readlink -f $0 | xargs dirname)
source ${SHELL_PATH}/scripts/global.sh

info "Installing Development packages"
info "Installing Go"
sudo pacman --noconfirm -Syu go # golang

info "Python"
sudo pacman --noconfirm -Syu python 		# Python 3
sudo pacman --noconfirm -Syu python-pip    		# pip installer
sudo pacman --noconfirm -Syu python-pipenv		# pip env manager
sudo pacman --noconfirm -Syu pyenv			# Python pyenv

info "Java JDK"
sudo pacman --noconfirm -Syu jdk-openjdk				# Java development kit

info "Node and nvm"
sudo pacman --noconfirm -Syu nodejs
sudo pikaur --noconfirm -S nvm


info "Visual Studio Code"
sudo pikaur --noconfirm -S visual-studio-code-bin
