asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-previous-release-team-keyring'
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
asdf plugin-add maven
asdf plugin-add gradle https://github.com/rfrancis/asdf-gradle.git

asdf plugin list
