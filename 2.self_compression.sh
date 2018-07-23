#!/bin/bash

if [ $# -eq 0 ]
then
	echo "usage: 2.self_compression.sh [--list] or [Sourse compressiond file] [Destination path]"
	echo "Self compression according to the file name suffix"
elif [ $# -eq 1 ]
then
	if [ $1 = "--list" ]
	then
		echo "Supported file types: zip tar tar.gz tar.bz2"
	fi
else
	filename="${1#*.}"
	if [ $filename = "tar.bz2" ]
	then
		tar -jxf $1
	elif [ $filename = "tar" ]
	then
		tar -xf $1
	elif [ $filename = "tar.gz" ]
	then
		tar -zxf $1
	elif [ $filename = "zip"]
	then
		unzip $1
	fi
	for file in ./${filename}
		pwd ${file}
fi
