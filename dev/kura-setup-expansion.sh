#!/bin/bash

ip="10.0.0.102"

user="kura"

scp ../.bkp/docker-kura-manager-1.0-SNAPSHOT.jar $user@$ip:/home/$user/kura-steroids/

scp -r ../kura-steroids/ $user@$ip:/home/$user/kura-steroids/

# removed bundle usb 
scp -r config.ini $user@$ip:/home/$user/

ssh $user@$ip

cd /opt/eclipse/kura_1.4.0_raspberry-pi-2/kura

cp /home/ubuntu/kura-steroids/* ../plugins/

