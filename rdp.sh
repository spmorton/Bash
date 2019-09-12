#! /bin/bash

# Author -  Scott P. Morton
# Date - 9/9/2019
# rdp.sh - a command line tool for uniform execution of xfreerdp
# Please honor the terms of GPL 2.0 and maintain my authorship
# license - GPL 2.0
#
echo
echo "Usage: ./rdp.sh servername username@somedomain.dom"
echo

if [ $# -eq 0 ]
then
    echo -n "Server: "
    read  server
    echo
    echo -n "UID: "
    read  uid
    echo
fi

if [ $# -eq 1 ] || [ $# -gt 2 ]
then
    exit 1
fi

echo
echo -n Password:
read -s password
echo

if [ $# -eq 2 ]
then
    server=$1
    uid=$2
fi

xfreerdp /w:1700 /h:920 /kbd:0x00000409 /bpp:24 /audio-mode:2 /sound:sys:alsa /drive:media,/home/$USER /network:lan /cert-tofu +clipboard /port:3389 /v:$server /u:$uid /p:$password

#xfreerdp /cert-tofu /bpp:24 /w:1600 /h:900 /t:$server /drive:/home/smorton /v:$server /u:$uid /p:$password
