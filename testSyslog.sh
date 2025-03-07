#!/bin/bash

dstSrv=$1

for i in $(seq 1 3)
do
	echo "TCP test to port 2800 for $dstSrv"
	echo -n "<14> This is a syslog TCP Port 2800 Test to $dstSrv" | nc -w3 -v $dstSrv 2800
	echo "UDP test to port 2800 for $dstSrv"
	echo -n "<14> This is a syslog UDP Port 2800 Test to $dstSrv" | nc -u -w3 -v $dstSrv 2800
	echo "UDP test to port 514 for $dstSrv"
	echo -n "<14> This is a syslog UDP Port 514 Test to $dstSrv" | nc -u -w3 -v $dstSrv 514
done


