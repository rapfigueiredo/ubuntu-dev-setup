#!/bin/bash

export LOCAL_DNS_SEARCH="test"
export DNS_YML_FILE=coredns-custom.yml
export DNS_SERVER_IP=$(dig | grep "SERVER:" | awk '{print $3}'| tr "#" "\n" | head -n 1)
export LOCAL_IP=$(hostname -i)
export DNS_SERVER_TLOG_IP=172.30.75.138
export DNS_SERVER_GOOGLE_IP=8.8.8.8

CURRENT_PATH=$(pwd)

if [ -f ${CURRENT_PATH}/${DNS_YML_FILE} ]; then
    rm -rf ${DNS_YML_FILE}
    ls -l
fi


source ${CURRENT_PATH}/../../config/.env



export MINIKUBE_IP=$(minikube ip)

echo "MINIKUBE_IP:${MINIKUBE_IP}"
export HOST_MINIKUBE_INTERNAL=$(minikube kubectl -- get configmap -n kube-system coredns -o yaml | grep "host.minikube.internal" | awk '{print $1}' | head -n 1)
echo "HOST_MINIKUBE_INTERNAL:${HOST_MINIKUBE_INTERNAL}"



cat <<EOF >  ${DNS_YML_FILE}
apiVersion: v1
kind: ConfigMap
metadata:
  name: coredns
  namespace: kube-system
data:
  Corefile: |
    .:53 {
        log
        errors
        health {
           lameduck 5s
        }
        ready
        kubernetes cluster.local in-addr.arpa ip6.arpa {
           pods insecure
           fallthrough in-addr.arpa ip6.arpa
           ttl 30
        }
        prometheus :9153
        hosts {
           ${HOST_MINIKUBE_INTERNAL} host.minikube.internal
           fallthrough
        }
        forward .  ${MINIKUBE_IP} 8.8.8.8 {
          except ${LOCAL_DNS_SEARCH} host.minikube.internal
        }
        cache 30
        loop
        reload
        loadbalance
    }
    ${LOCAL_DNS_SEARCH}:53 {
        errors
        cache 30
        forward . ${MINIKUBE_IP}
    }
EOF


minikube kubectl -- apply -f ${DNS_YML_FILE}

minikube kubectl -- get configmap -n kube-system coredns -o yaml

#minikube kubectl -- logs -n kube-system -l k8s-app=kube-dns

minikube kubectl -- apply -f https://raw.githubusercontent.com/kubernetes/minikube/master/deploy/addons/ingress-dns/example/example.yaml

sleep 10s

. test.sh