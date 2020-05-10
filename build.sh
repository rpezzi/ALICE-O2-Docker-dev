#!/bin/bash

IMAGE=${1:-"alidocklite"}

echo docker build -t $IMAGE .
docker build -t $IMAGE .
