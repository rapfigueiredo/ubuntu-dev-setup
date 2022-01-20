#!/bin/sh
#install asdf 
#dependencies apt install curl git

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc

echo "restart Ubuntu "


