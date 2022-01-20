#!/bin/sh
#dependecies apt install unzip

unzip -v || echo "install unzip 'sudo apt install unzip"
asdf update
asdf plugin update

MAVEN_VERSION=3.8.4
GRADLE_VERSION=7.3.3


#https://docs.microsoft.com/en-us/azure/developer/java/fundamentals/java-support-on-azure
asdf install java latest:zulu-17
asdf install java latest:zulu-11
asdf install java latest:zulu-8

asdf install java latest:temurin-8
asdf install java latest:temurin-11
asdf install java latest:temurin-17

asdf install java latest:microsoft-11
asdf install java latest:microsoft-17

#default jdk 11 LTS  zulu-11 or temurin-11
asdf local java $(asdf latest java temurin-11)

asdf install maven ${MAVEN_VERSION}

# set default maven
asdf local maven  ${MAVEN_VERSION}


asdf install gradle ${GRADLE_VERSION}

# set default gradle
asdf local gradle ${GRADLE_VERSION}


echo "JAVA_HOME:$(asdf which java)"
echo "MAVEN_HOME:/home/rogerio/.asdf/installs/maven/${MAVEN_VERSION}" 
echo "GRADLE_HOME:$(asdf which gradle)"


