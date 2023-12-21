#!/bin/sh
#dependecies apt install unzip

unzip -v || echo "install unzip 'sudo apt install unzip"
asdf update
asdf plugin update

MAVEN_VERSION=3.9.6
GRADLE_VERSION=8.5


#https://docs.microsoft.com/en-us/azure/developer/java/fundamentals/java-support-on-azure
asdf install java latest:temurin-8
asdf install java latest:microsoft-11
asdf install java latest:microsoft-17
asdf install java latest:microsoft-21
# set default local java
asdf local java latest:microsoft-21


asdf install maven ${MAVEN_VERSION}

# set default local maven
asdf local maven  ${MAVEN_VERSION}



echo "JAVA_HOME:$(asdf which java)"
echo "MAVEN_HOME:/home/rogerio/.asdf/installs/maven/${MAVEN_VERSION}" 


