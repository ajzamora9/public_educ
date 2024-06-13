#!/bin/bash
clear;

echo "What is your first name?"

	read firstname
	
echo "Welcome $firstname"
echo "You are currently in " `hostname`
echo "Logged in " `date`"."

#root test
if  test $USER = "root"
then
	echo "$firstname is a root user of " `hostname`
else
	echo "$firstname is not a root user of " `hostname`
fi
#end of root test

# IP TEST
echo
echo
echo "========================="
echo "IPTestTool-UAP0624v1"
echo "========================="
echo 
echo

function ip_test()
{
	IP_VAR=`ifconfig | grep "inet" | head -1 | tr -s " " ":" | cut -f3 -d ":"`
	echo $IP_VAR
}

function ch_func()
{
	local c=$1
	case $c in
		1) exit;;
		2) ip route show;;
		3) ip_test;;
		4) echo "" > ipvF.log | echo "" > ipt.log | echo "Log Cleared";;
		*) echo "Invalid Choice"
		
	esac
}

echo "1 - Quit"
echo "2 - Show IP Address (Detailed)"
echo "3 - Show IPV4 Address"
echo "4 - Clear Log"
echo
echo "Enter your choice: "
read choice
ch_func $choice

echo
echo "SAVE?"
read response
if test $response = "yes"
then
	case $choice in
		2) echo "< $firstname >" >> ipt.log | date >> ipt.log | echo "_______________" >> ipt.log | ip route show >> ipt.log | cat ipt.log;;
		3) echo "< $firstname >" >> ipvF.log | echo "`date`" >> ipvF.log | echo "_______________" >> ipvF.log | echo $IP_VAR >> ipvF.log | echo "" >> ipvF.log | echo "saved" | cat ipvF.log ;;
		
	esac	
fi

#thiw is a new addition V.1.1



		 
	

