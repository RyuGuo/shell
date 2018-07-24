#!/bin/bash

if [ $# -eq 0 ]
then
	echo "usage: 3.file_size.sh [-n N] [-d DIR]"
	echo "Show top N largest files/directoies"
elif [ $1 = "-n" ]
then
	if [ "$#" -eq 2 -o "$#" = 4 -a "$3" = "-d" ]
		then
		if [ $# -eq 2 ]
		then
			DIR="./"
		else
			DIR=$4
		fi
		cd $DIR
		Fcount=0
		for i in `ls $DIR`
		do
			file[$Fcount]=$i
			let "Fcount++"
		done
		echo "The largest files/directories in $DIR are:"
		i=1
		while(( $i <= $2 ))
		do
			j=0
			k=0
			SIZE_j=0
			SIZE_k=0
			while(( $j < `expr $Fcount - $i` ))
			do
				k=`expr $j + 1`
				SIZE_j=`ls -l ${file[$j]} | awk '{print $5}'`
				SIZE_k=`ls -l ${file[$k]} | awk '{print $5}'`
				if [ $SIZE_j -gt $SIZE_k ]
				then
					tmp=${file[$j]}
					file[$j]=${file[$k]}
					file[$k]=$tmp
				fi
				let "j++"
			done
			MAX_SIZE=`ls -l ${file[$k]} | awk '{print $5}'`
			if [ $MAX_SIZE -ge 1073741824 ]
			then
				MAX_SIZE=`echo "scale=1;$MAX_SIZE/1073741824"|bc`
				printf "    %-2d %4.1fG    %s\n" $i $MAX_SIZE ${file[$k]}
			elif [ $MAX_SIZE -ge 1048576 ]
			then
				MAX_SIZE=`echo "scale=1;$MAX_SIZE/1048576"|bc`
				printf "    %-2d %4.1fM    %s\n" $i $MAX_SIZE ${file[$k]}
			elif [ $MAX_SIZE -ge 1024 ]
			then
				MAX_SIZE=`echo "scale=1;$MAX_SIZE/1024"|bc`
				printf "    %-2d %4.1fK    %s\n" $i $MAX_SIZE ${file[$k]}
			else
				printf "    %-2d %4dB    %s\n" $i $MAX_SIZE ${file[$k]}
			fi
			let "i++"
		done
	fi
fi

