#!/bin/bash

echo "Installing updates.."
sudo apt-get update
sudo apt-get upgrade -y

echo "Installing programs.."
sudo apt-add-repository -y ppa:xorg-edgers/ppa
sudo apt-add-repository -y ppa:jon-severinsson/ffmpeg
sudo apt-get update
sudo apt-get install -y cmus tmux mumble chromium-browser nvidia-343 rxvt-unicode deluge clang llvm vorbis-tools zsh git steam ffmpeg ctags libsfml-dev
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial mono-xbuild automake autoconf libmono-cairo2.0-cil gtk-sharp2 libmono-cil-dev intltool

cd ~

echo "Installing zshell.."
rm -rf ~/.oh-my-zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
chsh

echo "Copying gpu configuring files.."
sudo mkdir /media/antti/manjaro-partition
sudo mount /dev/sdb2 /media/antti/manjaro-partition

sudo cp /media/antti/manjaro-partition/etc/X11/mhwd.d/nvidia.conf /etc/X11/xorg.xonf

sudo mkdir /etc/X11/xorg.conf.d
sudo cp /media/antti/manjaro-partition/etc/X11/xorg.conf.d/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/

echo "Running ubuntu fix.."
sudo wget -q -O - https://fixubuntu.com/fixubuntu.sh | sh

cd ~/Downloads/vim74
./configure --with-features=huge             --enable-multibyte             --enable-rubyinterp             --enable-pythoninterp             --with-python-config-dir=/usr/lib/python2.7/config             --enable-perlinterp             --enable-luainterp             --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install

cd ~/git/Pinta
./autogen.sh
make
sudo make install

sudo apt-get remove -y firefox pidgin mono-xbuild automake autoconf libmono-cairo2.0-cil gtk-sharp2 libmono-cil-dev libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev python-dev mercurial libxt-dev 
sudo apt-get autoremove -y && sudo apt-get clean

echo "Installing proprietary software.."
./Downloads/qt-opensource-linux-x64-5.3.2.run
./Downloads/skype-ubuntu-precise_4.3.0.37-1_i386.deb
./Downloads/bitwig-studio-1.0.15.deb

sudo cp ./Downloads/Bitwig 1.0.x Crack Only Win OSX Linux [licnep]/libs.jar /opt/bitwig-studio/bin/libs.jar

echo "All done! Reboot please"
