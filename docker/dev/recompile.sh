#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :24.05.16
#notes           :
#==============================================================================

### Variables

### Script start
#CID=$(docker ps -a | grep docker-dev | awk '{print $1}')
#CIP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${CID})

kill -15 $(ps aux | grep "dockerd -D" | awk ' $11 == "dockerd" { print $2 }')

cd /go/src/github.com/docker/docker

git pull

hack/make.sh binary

cp bundles/1.12.0-dev/binary-*/docker* /usr/bin

docker daemon -D&

