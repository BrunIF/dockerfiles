# OpenJDK 7

FROM dscho/openjdk7
MAINTAINER Johannes Schindelin "johannes.schindelin@gmx.de"

ENV JENKINS_URL http://jenkins.imagej.net/

ADD $JENKINS_URL/jnlpJars/slave.jar /usr/lib/jenkins/slave.jar
RUN useradd -d /var/jenkins -m jenkins

USER jenkins
CMD /usr/local/bin/java -jar usr/lib/jenkins/slave.jar -jnlpUrl $JENKINS_URL/computer/$NODE_NAME/slave-agent.jnlp -secret $NODE_SECRET
