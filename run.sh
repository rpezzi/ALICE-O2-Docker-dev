#!/bin/bash

# WORKDIR will be shared between the docker container and the host machine.
LOCALDIR=$HOME/alidocklite_ubuntu18.04
WORKDIR=/home/alidocklite
NAME=alidocklite

ALIDOCKLITE_RUN_CMD="docker run -d -it -p 22222:22 --hostname $NAME --name $NAME -e HOSTUSER=$USER  -v $LOCALDIR:$WORKDIR alidocklite_ubuntu18.04"

ALIDOCKLITE_ENTER_CMD="ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -XC 0.0.0.0 -p 22222 -i $LOCALDIR/.alidock-ssh/alidock.pem"

ALIDOCKLITE_RM_CMD="docker rm $NAME"

docker start alidocklite &> /dev/null
if [ $? == 0 ];
   then
   sleep .5
   $ALIDOCKLITE_ENTER_CMD
   else
   $ALIDOCKLITE_RM_CMD &> /dev/null
   $ALIDOCKLITE_RUN_CMD &> /dev/null
   sleep .5
   $ALIDOCKLITE_ENTER_CMD
fi
