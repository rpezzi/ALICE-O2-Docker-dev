#!/bin/bash

# WORKDIR will be shared between the docker container and the host machine.
# Be sure to have this folder owned by $USER.
WORKDIR=/data/sw/alice

echo docker run -it -v $WORKDIR:$WORKDIR aliceo2
docker run -it -v $WORKDIR:$WORKDIR aliceo2

