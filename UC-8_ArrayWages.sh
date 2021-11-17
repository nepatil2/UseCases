#!/bin/bash -x

isPartTime=1
isFullTime=2
EmpRatePerHr=20
MaxRateInMonth=100
NumOfWorkingDays=20

totalEmpHr=0
totalWorkingDays=0

function getWorkHrs(){
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

function getEmpWage(){
	echo $(($1*$EmpRatePerHr))
}
while [[ $totalEmpHr -lt $MaxRateInMonth && $totalWorkingDays -lt $NumOfWorkingDays ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3))
	getWorkHrs $empCheck
	totalEmpHr=$(($totalEmpHr+$empHrs))
	dailyWages[$totalWorkingDays]=$(($empHrs*$EmpRatePerHr))
done

	totalSalary="$( getEmpWage $totalEmpHr )"
