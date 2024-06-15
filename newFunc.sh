#added new shit in the repo
#v1.0a - added preliminary code

#!/bin/bash
clear;

let i=0;

while (($i<9999))
	do
		echo "port $i: "
		line=`ssh userland@192.168.1.2 -p $i | grep "ssh:"`
		echo "line: " $line
		
		let i=$i+1
	done


