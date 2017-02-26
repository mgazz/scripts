#!/bin/bash

SW_LOCATION=/home/$USER/sw

write_variable(){
    presence=$(cat ~/.profile | grep "export $1" )

    # if not present of comment --> add variable
    if [[ $presence != "" && $presence != "#*" ]]; then
        sed /"export $1"/d ~/.profile > .profile
        mv .profile ~/.profile
    fi

    echo "export $1=$2" >> ~/.profile
}


write_slash_bin(){
    #delete PATH=$VARIABLE/bin...
    presence=$(cat ~/.profile | grep "PATH=\$$1" )

    if [[ $presence != "" && $presence != "#*" ]]; then
        sed /"PATH=\$$1"/d ~/.profile  > .profile
        mv .profile ~/.profile
    fi
    echo "PATH=\$$1/bin:\$PATH" >> ~/.profile
    #cat ~/.profile
}

write_variable_bin(){
    write_variable $1 $2
    write_slash_bin $1
}

# golang setup
ARC=`uname -a | awk '{print $12}'`
echo $ARC
if [ "$ARC" =  "x86_64" ]; then
    wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz -P /tmp/
	tar -xf /tmp/go1.8.linux-amd64.tar.gz -C $SW_LOCATION
fi
if [ "$ARC" = "i686" ]; then
	wget https://storage.googleapis.com/golang/go1.8.linux-386.tar.gz -P /tmp/
	tar -xf /tmp/go1.8.linux-386.tar.gz -C  $SW_LOCATION
fi


#write_variable GOROOT $SW_LOCATION/go
write_variable_bin GOROOT $SW_LOCATION/go

write_variable GOPATH /home/$USER/workspace/go

source ~/.profile

go get github.com/revel/cmd/revel
