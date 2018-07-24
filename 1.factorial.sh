#!/bin/bash

function factorial(){
	local num=$1
	if [ ${num} -gt 1 ]
	then
		factorial `expr ${num} - 1`
		fac=`expr ${num} \* ${fac}`
	else
		fac=1
fi
	return $fac
}

if [ $# -eq 0 ]
then
	echo "usage: 1.factorial.sh [n]"
	echo "calculates a number's factorial"
else
	factorial $1
	echo $fac
fi
