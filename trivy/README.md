# aquasec/trivy 
Install container as a command aquasec/trivy. 

## install aquasec/trivy
1. cp .local/bin/trivy  ~/.local/bin/trivy
2. sudo usermod -a -G docker $USER

## junit template report
(trivy.tpl example)[https://github.com/lgulliver/ContainerScanning/tree/master/templates]
1. cp ~/trivy/templates/junit.tpl ./templates/junit.tpl

## example of use 
```
IMAGE_NAME="oraclelinux:7-slim" && \
trivy image --severity LOW,MEDIUM --format template --template "@templates/junit.tpl" -o ${IMAGE_NAME}-junit-report-low-med.xml ${IMAGE_NAME}
```