#!/bin/bash -x

isPartTime=1;
isfullTime=2;
MaxHrsInMonth=100;
empRatePerHr=20;
NumOfWorkingDays=20;

totalEmpHr=0;
totalWorkingDays=0;

declare -A dailyWages
function  getWorkHrs(){
	case $1 in
		$isFullTime)
			empHrs=8;
			;;
		$isPartTime)
			empHrs=4;
			;;
		*)
			empHrs=0;
			;;
	esac
}

function  getEmpWage(){
	echo $(($1*$empRatePerHr))
}


while [[ $totalEmpHr  -lt $MaxHrsInMonth  &&  $totalWorkingDays -lt $NumOfWorkingDays ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3))
	getWorkHrs $empCheck
	totalEmpHr=$(($totalEmpHr+$empHrs))
	dailyWages[$totalWorkingDays]=$(($empHrs*$empRatePerHr))
done
	totalSalary="$( getEmpWage $totalEmpHr )"
	echo ${dailyWages[@]} 	#using array
	echo ${!dailyWages[@]}   #using Dictionary
	
