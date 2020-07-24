FROM ubuntu:18.04

WORKDIR /home/alidocklite

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get -y upgrade && apt-get clean

RUN apt-get install -y curl libcurl4-gnutls-dev build-essential gfortran cmake libmysqlclient-dev \
                   xorg-dev libglu1-mesa-dev libfftw3-dev libxml2-dev git unzip autoconf automake \
                   autopoint texinfo gettext libtool libtool-bin  pkg-config bison flex libperl-dev \
                   libbz2-dev swig liblzma-dev libnanomsg-dev libyaml-cpp-dev rsync lsb-release \
                   unzip environment-modules python3-pip ninja-build python3-setuptools python3-dev \
                   python-dev libglfw3-dev libglfw3 ssh sudo emacs-nox tclsh nano parallel \
                   python3-matplotlib bc && apt-get clean


RUN pip3 install --upgrade pip

RUN pip3 install alibuild --upgrade

ENV USER_DIR /home/alidocklite/

ENV ALIBUILD_WORK_DIR /home/alidocklite/sw/

ADD alidocklite_init.sh /bin/

ENTRYPOINT /bin/alidocklite_init.sh "/bin/bash"
