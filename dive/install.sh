#!/bin/sh
DIVE_VERSION=$(curl -s "https://api.github.com/repos/wagoodman/dive/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo dive.deb "https://github.com/wagoodman/dive/releases/latest/download/dive_${DIVE_VERSION}_linux_amd64.deb"
sudo apt install -y ./dive.deb
rm -rf ./dive.deb