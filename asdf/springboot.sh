asdf update

#springboot suport java version https://start.spring.io/

#https://www.pentalog.com/blog/java-versions-distributions-platforms

#adptopenjdk https://adoptopenjdk.net/supported_platforms.html
#asdf install java adoptopenjdk-8.0.282+8
#asdf install java adoptopenjdk-11.0.10+9
#asdf install java adoptopenjdk-15.0.2+7

#Zulu https://www.azul.com/downloads/zulu-community/?package=jdk
#azure https://docs.microsoft.com/pt-br/azure/developer/java/fundamentals/java-jdk-install
#azure https://docs.microsoft.com/pt-br/azure/developer/java/fundamentals/java-jdk-long-term-support
asdf install java zulu-15.29.15
asdf install java zulu-11.45.27
asdf install java zulu-8.52.0.23

#aws  https://aws.amazon.com/pt/corretto/
#asdf install java corretto-8.282.08.1
#asdf install java corretto-11.0.10.9.1
#asdf install java corretto-15.0.2.7.1

#alibaba https://github.com/alibaba/dragonwell11
#asdf install java dragonwell-8.5.5
#asdf install java dragonwell-11.0.7.2+9

#oracle https://www.graalvm.org/
#asdf install java graalvm-20.2.0+java8
#asdf install java graalvm-20.2.0+java11

#liberica https://bell-sw.com/
#asdf install java liberica-8u282+8
#asdf install java liberica-11.0.10+9
#asdf install java liberica-15.0.2+10


#default jdk 11 LTS
asdf local java zulu-11.45.27

asdf install maven 3.6.3

# set default maven
asdf local maven 3.6.3

asdf install gradle 6.8.2

# set default gradle
asdf local gradle 6.8.2



