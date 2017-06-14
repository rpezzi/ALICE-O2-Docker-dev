FROM centos:7

WORKDIR /data/sw/alice

RUN yum -y install epel-release && yum clean all

RUN yum -y install python-pip && yum clean all

#RUN yum install -y \
# git 


RUN yum install -y gcc gcc-c++ gcc-gfortran make patch sed \
  libX11-devel libXft-devel libXpm-devel libXext-devel \
  libXmu-devel mesa-libGLU-devel mesa-libGL-devel ncurses-devel \
  curl curl-devel bzip2 bzip2-devel gzip unzip tar \
  expat-devel subversion git flex bison imake redhat-lsb-core python-devel \
  libxml2-devel wget openssl-devel krb5-devel \
  automake autoconf libtool which perl-ExtUtils-Embed.noarch \
  mariadb.x86_64 mariadb-devel.x86_64 mariadb-server.x86_64 \
  environment-modules


RUN pip install --upgrade pip
RUN pip install pyyaml


ENV PATH $PATH:/data/sw/alice/alibuild/

