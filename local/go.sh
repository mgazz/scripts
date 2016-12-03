#!/bin/bash

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

update_profile(){
    export_path
    source ~/.profile
}

export_path(){
    presence=$(cat ~/.profile | grep "export PATH" )
    echo presence: $presence
    if [[ $presence != "" && $presence != "#*" ]]; then
        echo update profile
        sed /"export PATH"/d ~/.profile > .profile
        mv .profile ~/.profile
        #echo $updated_profile > ~/.profile
    fi
    echo "export PATH" >> ~/.profile
    #cat ~/.profile
}


go_version="1.6.4"

go_dest="/home/$USER"

# check architecture
ARC=`uname -a | awk '{print $12}'`

if [ "$ARC" =  "x86_64" ]; then
    ARC="amd64"

elif [ "$ARC" = "i686" ]; then
    ARC="386"
fi


export_path(){
    presence=$(cat ~/.profile | grep "export PATH" )
    echo presence: $presence
    if [[ $presence != "" && $presence != "#*" ]]; then
        echo update profile
        sed /"export PATH"/d ~/.profile > .profile
        mv .profile ~/.profile
        #echo $updated_profile > ~/.profile
    fi
    echo "export PATH" >> ~/.profile
    #cat ~/.profile
}


go_version="1.7"

go_dest="/home/$USER"
go_code="/home/$USER/gocode"
mkdir -p $go_code

mkdir -p /tmp/compile

cd /tmp/compile

# check architecture
ARC=`uname -a | awk '{print $12}'`

if [ "$ARC" =  "x86_64" ]; then
    ARC="amd64"

elif [ "$ARC" = "i686" ]; then
    ARC="386"
fi

mkdir -p $go_dest
if ! [ -d "$go_dest/go" ]; then
	wget https://storage.googleapis.com/golang/go"$go_version".linux-"$ARC".tar.gz -O go.tar.gz
	tar xvzf go.tar.gz -C $go_dest
    	rm go.tar.gz
fi

# check funtions.sh for write_varialbe
write_variable_bin GOROOT "$go_dest/go"
write_variable GOPATH "$go_code"

update_profile

go get github.com/revel/cmd/revel
go get github.com/tools/godep
