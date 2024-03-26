#!/bin/bash

if [[ $# -ne 1 ]]
  then echo "Need one argument: amount of nodes which will be managed by ansible-server"
  exit 0
fi
REGEXPR="^[0-9]+$"
if [[ ! $1 =~ $REGEXPR ]]
  then echo "Argument must be a number"
  exit 0
fi

NET1=ansblserv1_hosts
docker network create $NET1
./hosts.sh $1 $NET1
./server.sh $1 $NET1

echo "FINISH SUCCESS"

