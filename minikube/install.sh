#!/bin/bash
#https://minikube.sigs.k8s.io/docs/start/
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm -rf minikube-linux-amd64

[ "$(cat ~/.bashrc | grep  "kubectl"  | wc -l)" -eq "0" ] && { echo "alias kubectl=\"minikube kubectl --\"" >> ~/.bashrc; echo "alias k=\"kubectl\"" >> ~/.bashrc; }
[ "$(cat ~/.bashrc | grep  "minikube start" | wc -l)" -eq "0" ] &&  echo "minikube start" >> ~/.bashrc

cat ~/.bashrc

source ~/.bashrc

minikube kubectl -- -version

kubectl cluster-info

k get nodes