#!/bin/sh
#https://minikube.sigs.k8s.io/docs/start/
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm -rf minikube-linux-amd64

cat ~/.bashrc | grep  "minikube start" | wc -l 
[ "$(cat ~/.bashrc | grep  "minikube start" | wc -l)" -eq "0" ] && { alias kubectl="minikube kubectl --"; alias k="kubectl" }
[ "$(cat ~/.bashrc | grep  "minikube start" | wc -l)" -eq "0" ] &&  echo "minikube start" >> ~/.bashrc

source ~/.bashrc