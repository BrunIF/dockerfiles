# Jenkins

FROM dscho/openjdk7
MAINTAINER Johannes Schindelin "johannes.schindelin@gmx.de"

RUN mkdir /usr/local/jenkins

RUN cd /usr/local/jenkins && curl -L -O http://mirrors.jenkins-ci.org/war/latest/jenkins.war

# Needed to prevent a NullPointerException in X11FontManager
RUN apt-get install -y ttf-dejavu
RUN apt-get install -y fontconfig

RUN groupadd jenkins
RUN useradd -m -g jenkins -d /var/jenkins jenkins

EXPOSE 8080
CMD cd /usr/local/jenkins && su -c "java -Djava.a.t.headless=true -jar jenkins.war" jenkins
