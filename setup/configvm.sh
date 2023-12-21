#!/bin/sh
#In powershell check wsl
#>wsl -l -v
#NAME            STATE           VERSION
#* Ubuntu-XX.XX    Running         2



# Start Ubuntu-XX.XX
# install && update  ubuntu 
sudo apt update
sudo apt upgrade -y
sudo apt install -y fontconfig daemonize unzip  curl git jq silversearcher-ag

