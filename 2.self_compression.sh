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
	suffix="${1##*.}"
	filename="${1%.*}"
	if [ $suffix = "gz" -o $suffix = "bz2" ]
	then
		suffix="${filename##*.}.$suffix"
		filename="${filename%.*}"
	fi
	filename="${filename##*/}"
	
	echo "Archive:  $1"
	mkdir $2$filename
	echo "   creating:  $2$filename/"
	if [ $suffix = "tar.bz2" ]
	then
		tar -jxf $1 -C $2$filename
	elif [ $suffix = "tar" ]
	then
		tar -xf $1 -C $2$filename
	elif [ $suffix = "tar.gz" ]
	then
		tar -zxf $1 -C $2$filename
	elif [ $suffix = "zip" ]
	then
		unzip -qd $2$filename $1
	fi
	for file in  $2$filename/*
	do
		echo "  inflating:  $file"
	done
fi
