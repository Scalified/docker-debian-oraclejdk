FROM debian:jessie

MAINTAINER Vladyslav Baidak

ENV JAVA_HOME=/opt/jdk
ENV JAVA_ARCHIVE_URL=http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz
ENV JAVA_ARCHIVE_NAME=jdk.tar.gz
ENV PATH=$PATH:$JAVA_HOME/bin

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN mkdir -p $JAVA_HOME

RUN apt-get update

RUN apt-get install -y curl \
        locales

RUN sed -i -e "s/# $LANG/$LANG/" /etc/locale.gen \
        && locale-gen $LANG.UTF-8 \
        && dpkg-reconfigure --frontend=noninteractive locales \
        && update-locale LANG=$LANG

RUN curl -kL --header "Cookie: oraclelicense=accept-securebackup-cookie" --output $JAVA_HOME/$JAVA_ARCHIVE_NAME $JAVA_ARCHIVE_URL

RUN tar --strip-components=1 -zxf $JAVA_HOME/$JAVA_ARCHIVE_NAME -C $JAVA_HOME && rm $JAVA_HOME/$JAVA_ARCHIVE_NAME
