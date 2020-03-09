FROM centos:7

WORKDIR /data/sw/alice

RUN yum -y install epel-release && yum clean all

RUN yum install -y git mysql-devel curl curl-devel bzip2 bzip2-devel unzip autoconf \
    automake texinfo gettext gettext-devel libtool freetype freetype-devel libpng \
    libpng-devel sqlite sqlite-devel ncurses-devel mesa-libGLU-devel libX11-devel \
    libXpm-devel libXext-devel libXft-devel libxml2 libxml2-devel motif motif-devel \
    kernel-devel pciutils-devel kmod-devel bison flex perl-ExtUtils-Embed \
    environment-modules tk-devel nano python-requests python3-pip

RUN yum install -y centos-release-scl

RUN yum-config-manager --enable rhel-server-rhscl-7-rpms

RUN yum install -y devtoolset-7
 
RUN yum clean all

RUN  pip3 install alibuild --upgrade

ENV USER_DIR /data/sw/alice/

ENV ALIBUILD_WORK_DIR /data/sw/alice/sw

ADD setuser.sh /bin/

ADD wrapper.sh /bin/

ENTRYPOINT /bin/wrapper.sh "/bin/bash"

