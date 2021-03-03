#!/bin/sh
cp -rf .local/bin/trivy  ~/.local/bin/trivy
sudo usermod -a -G docker $USER