# To build:
# docker build -t my-hr-head .
FROM ubuntu:14.04
MAINTAINER Mike Bee mbonsign@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install wget
RUN apt-get -y install bc
RUN apt-get -y install git
RUN apt-get -y install dpkg
RUN apt-get -y install  libgl1-mesa-dev-lts-trusty 

#RUN wget https://raw.githubusercontent.com/hansonrobotics/HEAD/master/scripts/hrtool -O /tmp/hrtool
RUN wget https://raw.githubusercontent.com/MikeyBeez/hrtool/master/hrtool -O /tmp/hrtool
RUN chmod +x /tmp/hrtool
RUN mkdir ~/hansonrobotics
RUN  /tmp/hrtool -i
RUN  /tmp/hrtool -G
RUN rm /tmp/hrtool
RUN ~/hansonrobotics/HEAD/scripts/hrtool -B

