#!/bin/bash
file="dane.txt"
	if [[ ! -f $file || ! -s $file ]]; then
	echo "File not found or empty"
	exit 1


	else 
	echo "File found. Processing in awk ...."

	awk '{
		if ($1 < 5) {
		print $0
	}
		if (NR == 5) {
		print $0
	}
		if (/^30/ && /20$/) {
		print $0 
	}
		if (NR == 4) {
			sum=0;
			for (i=1; i<=NF; i++) {
			sum+=$i; 
			}
			printf "sum of row %d: %.3f\n", NR, sum		
		}
		
	}' $file



	fi
