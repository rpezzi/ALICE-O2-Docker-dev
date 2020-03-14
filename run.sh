#!/bin/bash


# WORKDIR will be shared between the docker container and the host machine.
# Be sure to have this folder owned by $USER.
LOCALDIR=$HOME/alidocklite_ubuntu18.04
WORKDIR=/home/alidocklite

echo docker run -it -v $LOCALDIR:$WORKDIR alidocklite_ubuntu18.04
docker run -it -v $LOCALDIR:$WORKDIR alidocklite_ubuntu18.04
