#!/bin/sh
mkdir -p ~/.local/bin
cp -rf .local/bin/trivy  ~/.local/bin/trivy
sudo usermod -a -G docker $USER
su -l $USER
