#!/bin/bash 
file="dane.txt"

	if [[ ! -f $file || ! -s $file ]]; then 
	echo "File not found or empty file"
	exit 1

	else 
		awk '{total_lines++

			if ($1 < 5) {
				print "[WARNING: critical value]:", $0
				small_count++
		}
			if (NR==5) {
				print "[RAPORT_LINE_5]:", $0
		}
			if (/^30/ && /20$/) {
				print "[PATTERN_MATCHING_LINE]:", $0
				pattern_count++
		}
			if (NR==4) {
				sum=0;
				for(i=1; i<=NF; i++)
				sum+=$i;
				printf "[STATISTICS] sum of lines %d: %.2f\n", NR, sum
			}
		}
		END {
			print "\n --------------STATUS ----------- "
			printf "total_lines %d\n", total_lines++
			printf "lines_with_critical_value_less_than_5 %d\n", small_count++
			printf "lines_pattern_matching %d\n", pattern_count++
	
	}' $file

	fi
				
