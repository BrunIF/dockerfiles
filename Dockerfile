# OpenJDK 7

FROM ubuntu
MAINTAINER Johannes Schindelin "johannes.schindelin@gmx.de"

ENV OPENJDK openjdk-1.7.0-u40-unofficial-linux-amd64-image

RUN apt-get update
RUN apt-get install -y curl unzip

RUN cd /tmp/ && curl -L -O https://bitbucket.org/alexkasko/openjdk-unofficial-builds/downloads/$OPENJDK.zip
RUN cd /usr/local/ && unzip /tmp/$OPENJDK.zip
RUN apt-get install -y libfreetype6
RUN cd /usr/local/ && ln -s $OPENJDK jdk
RUN cd /usr/local/bin && for file in ../jdk/bin/*; do test ! -x $file || ln -s $file .; done
RUN apt-get clean
