#!/bin/bash


grep -e "NEWUSER=\w" Dockerfile

if [ $? -eq 1 ] 
then
	echo "Please set NEWUSER in Dockerfile";
	exit 1;
fi


CONTAINERNAME=devcon
echo "### container name set to: $CONTAINERNAME"

docker stop $CONTAINERNAME # it might be nice if this was behind an -f flag
docker rm $CONTAINERNAME

docker build ./ --tag code
echo "### image built"

export DOCKERGID=`cat /etc/group | grep docker | cut -d ':' -f 3`
echo "### Docker group ID detected as: $DOCKERGID"


echo "### starting container ..."

docker run 	--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock 	\
		--mount type=bind,src=`pwd`/random.txt,dst=/var/run/random.txt,readonly	\
		--mount type=bind,src=/tmp/,dst=/mnt/tmp/				\
		--name $CONTAINERNAME --hostname $CONTAINERNAME --env DOCKERGID 	\
		-p 6000-6001:6000-6001 -p 4300:4300 -p 4200:4200 			\
		--interactive --tty 							\
		  code

		
