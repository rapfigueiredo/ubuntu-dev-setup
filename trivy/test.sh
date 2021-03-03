#!/bin/sh
IMAGE_NAME=${1}

rm -rf test-junit-report-low-med.xml
trivy image ${IMAGE_NAME}
trivy image \
  --severity LOW,MEDIUM \
  --format template \
  --template "@trivy/templates/junit.tpl" \
  -o test-junit-report-low-med.xml ${IMAGE_NAME}

cat   test-junit-report-low-med.xml