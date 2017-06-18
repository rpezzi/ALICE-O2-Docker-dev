#!/bin/bash
WORKDIR=/data/sw/alice
mkdir -p $WORKDIR
echo docker run -it -v /data/sw/alice:/data/sw/alice aliceo2
docker run -it -v /data/sw/alice:/data/sw/alice aliceo2

