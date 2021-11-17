#!/bin/bash -x

ispresent=1;
randomcheck=$((RANDOM%2));
#checkPresent=1;
if [ $isPresent -eq $randomCheck ]
then
	echo "Employee is present";
else
	echo "Employee is absent";
fi

