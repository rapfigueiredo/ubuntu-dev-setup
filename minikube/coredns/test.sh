#!/bin/bash

export LOCAL_DNS_SEARCH="test"
export DNS_SERVER_IP=$(dig | grep "SERVER:" | awk '{print $3}'| tr "#" "\n" | head -n 1)
export DNS_SERVER_TLOG_IP=172.30.75.138
export DNS_SERVER_GOOGLE_IP=8.8.8.8

minikube kubectl -- get ing -n kube-system


nslookup hello-john.${LOCAL_DNS_SEARCH} $(minikube ip) || echo 1
nslookup hello-jane.${LOCAL_DNS_SEARCH} $(minikube ip) || echo 2
nslookup www.google.com  ${DNS_SERVER_GOOGLE_IP} ||  echo 3
nslookup tl-douradilho-04.embratec.local ${DNS_SERVER_TLOG_IP} ||  echo 5
ping -c 1 hello-john.${LOCAL_DNS_SEARCH} ||  echo 7
ping -c 1 hello-jane.${LOCAL_DNS_SEARCH} ||  echo 9
#ping -c 1 www.google.com  ||  echo 11
echo "tl-douradilho-03.embratec.local: $(dig +short tl-douradilho-03.embratec.local)"  || echo 14
#
minikube ssh -- 'nslookup www.google.com  ${DNS_SERVER_GOOGLE_IP}' ||  echo 4
minikube ssh -- 'nslookup tl-douradilho-04.embratec.local ${DNS_SERVER_TLOG_IP}' ||  echo 6
minikube ssh -- 'ping -c 1 hello-john.${LOCAL_DNS_SEARCH}' ||  echo 8
minikube ssh -- 'ping -c 1 hello-jane.${LOCAL_DNS_SEARCH}' ||  echo 10
minikube ssh -- 'ping -c 1 www.google.com' ||  echo 12
minikube ssh -- 'dig +short tl-douradilho-03.embratec.local ${DNS_SERVER_TLOG_IP}'  || echo 13
minikube ssh -- 'dig +short tl-douradilho-03.embratec.local ${DNS_SERVER_TLOG_IP}'  ||  echo 15