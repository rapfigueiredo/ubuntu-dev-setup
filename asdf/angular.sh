#!/bin/bash
CYCLE="20"

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-previous-release-team-keyring'

asdf update
asdf plugin update

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