#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :25.05.16
#notes           :
#==============================================================================

### Variables

### Script start

#get dev container id
CID=$(docker ps -a | grep docker-dev | awk '{print $1}')

#get dev container ip
CIP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${CID})
ssh-keygen -f "/home/michele/.ssh/known_hosts" -R "$CIP"
# copy private key over ssh
cat ~/.ssh/id_rsa | ssh root@172.17.0.2 "mkdir -p ~/.ssh && cat >> ~/.ssh/id_rsa"
#
ssh root@172.17.0.2 "chmod 400 ~/.ssh/id_rsa"

#export CIP
ANS_DEV_IP=$(awk '/\[dev\]/{getline; print}' /etc/ansible/hosts)
echo current dev file ip: $ANS_DEV_IP
echo actual ip: $CIP

if [[ "$CIP" == "$ANS_DEV_IP" ]]; then
    echo equals 
else
    echo not equals
    #remove stale ip 
    sudo sed -i "/^$ANS_DEV_IP/d" /etc/ansible/hosts
    # add new ip after line with [dev]
    sudo sed  -i '/\[dev\]/a '"$CIP" /etc/ansible/hosts
fi
