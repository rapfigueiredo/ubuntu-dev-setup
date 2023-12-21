#!/bin/bash
CYCLE="20"

URL="https://endoflife.date/api/nodejs/${CYCLE}.json"
echo "URL=${URL}"
LTS=$(curl --request GET \
  --url ${URL} \
  --header 'Accept: application/json' | jq .latest)
echo "LTS:${LTS}" 

asdf install nodejs ${LTS}
asdf global nodejs ${LTS}

node --version
npm version