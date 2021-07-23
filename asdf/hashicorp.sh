#!/bin/sh
asdf update
asdf plugin update

asdf install consul latest
asdf install vault latest
asdf install terraform latest


asdf local consul $(asdf list consul latest)
asdf local vault $(asdf list vault latest)
asdf local terraform $(asdf list terraform latest)