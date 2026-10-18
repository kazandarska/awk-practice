#!/usr/bin/awk -f 
	# parser count fields 1
		# count fields in each line
		# find line with max fields
		# report the number of corrupted lines 

	# for each line print the number of fields 
	BEGIN { FS = ";|[ \t]+"
	}

	{
		fields_number[NR] = NF 
		if (NR == 1) {
			maxfld = NF
		} 
	} 

	# count corrupted lines 
	END {
		print "Intact line has", maxfld, "fields"

		corrupted = 0
		for (i = 1; i <= NR; i++) {

			print "line", i, "has", fields_number[i]
			if (fields_number[i] < maxfld) {
			corrupted++
		}
	}
	print "Total corrupted lines without", maxfld, "fields:", corrupted
}	

