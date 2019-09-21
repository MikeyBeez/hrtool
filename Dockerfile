# To build:
# docker build -t my-hr-head .
FROM ubuntu:14.04
MAINTAINER Mike Bee mbonsign@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install wget
RUN apt-get -y install bc
RUN apt-get -y install curl
RUN apt-get -y install git
RUN apt-get -y install dpkg
RUN apt-get -y install software-properties-common
RUN apt-get -y install  libgl1-mesa-dev-lts-trusty 
# I added these next lines because cmake wants GCC 5.0 or higher:

RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get -y update
RUN apt-get -y install gcc g++ gcc-5 g++-5 
RUN apt-get -y update
RUN sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5





#RUN wget https://raw.githubusercontent.com/hansonrobotics/HEAD/master/scripts/hrtool -O /tmp/hrtool
RUN wget https://raw.githubusercontent.com/MikeyBeez/hrtool/master/hrtool -O /tmp/hrtool
RUN chmod +x /tmp/hrtool
RUN mkdir ~/hansonrobotics
WORKDIR ~/hansonrobotics
RUN git clone https://github.com/opencog/opencog.git  
RUN git clone https://github.com/opencog/atomspace.git
RUN git clone https://github.com/opencog/moses.git
RUN git clone https://github.com/opencog/cogutil.git

#RUN  /tmp/hrtool -i
#RUN  /tmp/hrtool -G
#RUN rm /tmp/hrtool
#RUN ~/hansonrobotics/HEAD/scripts/hrtool -B

