#!/usr/bin/awk -f 
	# parser count fields 2
		# count fields in each line
		# find line with max number of fields
		# report the number of corrupted lines
		# report lines containing strings 

	# use different types of field separator 
	BEGIN { FS = ";|[ \t]+"
		printf "====================================\n"
		printf "=============REPORT=================\n"
	}
	# find line with max number of fields using the header row as a pattern
	{
		fields_number[NR] = NF 
		if (NR == 1) {
			maxfld = NF
		}
	# enter string location: line, field	
		for (i = 1; i <= NF; i++) {
			if ($i ~ /[a-zA-Z]/) {
		       		printf "WARNING: Line %d field %d string: %s\n", NR, i, $i
			}
		}
	}

	# count corrupted lines  
	END {
		printf "\nIntact line has %d field(s)\n", maxfld

		corrupted = 0
		for (i = 1; i <= NR; i++) {
			if (fields_number[i] < maxfld) {
			corrupted++
			wrong[fields_number[i]]++
			}
		}

	printf "\nTotal corrupted lines (less than %d fields): %d\n\n", maxfld, corrupted 

	# report corrupted lines statistics
	if (corrupted > 0) {
		for (fields in wrong) {
			printf "Lines with %d fields %d\n", fields, wrong[fields]
		}
	}
}



