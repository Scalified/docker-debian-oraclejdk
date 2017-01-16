FROM debian:jessie

MAINTAINER Vladyslav Baidak

ENV JAVA_HOME=/opt/jdk
ENV JAVA_BINARY_URL=http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz
ENV JAVA_BINARY_NAME=jdk.tar.gz
ENV PATH=$PATH:$JAVA_HOME/bin

RUN mkdir -p $JAVA_HOME

RUN apt-get update

RUN apt-get install -y curl

RUN curl -kL --header "Cookie: oraclelicense=accept-securebackup-cookie" --output $JAVA_HOME/$JAVA_BINARY_NAME $JAVA_BINARY_URL

RUN tar --strip-components=1 -zxf $JAVA_HOME/$JAVA_BINARY_NAME -C $JAVA_HOME && rm $JAVA_HOME/$JAVA_BINARY_NAME
