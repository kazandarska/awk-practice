#!/usr/bin/awk -f

	# parser.awk - data parsing and validation
	# input - rows of text and numbers separated by tab
		# some fields contain comma-separated elements (sub-elements)
		# numbers: integers
	# usage - corrupted records and fields detection, sub-elements separation, summation of numbers 
	# output - corrupted lines sent to the error file, sub-elements split, summed data sent to the statistics file   
	BEGIN {
		print "VALIDATION" > ("error.txt")
		print "STATISTICS" > ("stat.txt")
	}
	# set max number of fields
	{ 
		if (NF > nfld) {
			nfld = NF
		}
	# check empty fileds, corrupted lines	
		     
		if (NF != nfld) {
			print "Line", NR, "is corrupted: has", NF, "fields, instead of", nfld >> ("error.txt")
		}
	# sum each field 

		for (i = 1; i <= NF; i++) {
			sum[i] += $i
	# check if the field consists of any strings		
			
			if ($i ~ /[a-zA-Z]/) {
				print "WARNING: line", NR, "field", i, "string:", $i >> ("error.txt")

	# split - find sub-elements (subele), split them
				if ($i ~ /,/) {
				count_elements = split($i, subele, ",")
					print "Sub-elements found", count_elements >> ("error.txt")
				
					for (j = 1; j <= count_elements; j++) {
						print subele[j] >> ("error.txt")
					}
				}		
		
			}
		}
	}

	END {
		for (i = 1; i <= nfld; i++)
			print "Sum of column", i, ":", sum[i] > ("stat.txt")
	}
    

			
		

