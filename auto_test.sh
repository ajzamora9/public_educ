#!/bin/bash
clear; let totalsize=0; let currentsize=0

function zerofied()
{
	local csize=$1
	if (($csize < 20001))
		then
			let csize=0;
			echo "zerofied"
			break
			
		fi 
}

echo "put the directory"
read dir_Text

#for i in /probeD10/mbu/Arct/stz03/develop/stz03.d1x/Programs/*.uno
for i in $dir_Text
do

	echo $i
	let currentsize=`ls -l $i | tr -s " " | cut -f5 -d " "`
	echo "current:" $currentsize
	let cs=$currentsize
	while (($cs > 20000))
	do
		echo "Reduction: " $cs
		zerofied $cs
		let cs=$cs-1000
		
		
		
	done
	let totalsize=$totalsize+$currentsize
	echo "OUT: " $totalsize
done
echo "END LOOP ";
echo "<"`date`">" >> a_test.log;
echo "The total space used is "$totalsize "bytes." >> a_test.log;
echo "=============================";
cat a_test.log
