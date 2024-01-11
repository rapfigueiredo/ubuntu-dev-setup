#!/bin/bash
#https://docs.microsoft.com/en-us/azure/developer/java/fundamentals/java-support-on-azure
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add maven

asdf update
asdf plugin update

MAVEN_VERSION=3.9.6


asdf install java latest:temurin-8
asdf local java latest:temurin-8


asdf install maven ${MAVEN_VERSION}

# set default local maven
asdf local maven  ${MAVEN_VERSION}