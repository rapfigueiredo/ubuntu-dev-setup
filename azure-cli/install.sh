#!/bin/sh
sudo apt remove azure-cli -y && sudo apt autoremove
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
