#!/usr/bin/awk -f
	# gsub 1 - sum numbers containing commas and decimal points
			# count lines, fields, and empty fields 
		# input - number with commas (nn,bb.dd)


	BEGIN { 
		"date +%Y-%m-%d" | getline report_date
		close("date +%Y-%m-%d") 
		printf("=========================\n")
		printf("REPORT DATE: %s\n", report_date)
		printf("=========================\n")
	}


	NR == 1 {
		nfld = NF
	}
	{
		lines++
		fields += nfld

		for (i = 1; i <= NF; i++) {
			gsub(/,/, "", $i)
			sum += $i
		}
			
			if (NF != nfld) {
				empty_fields += (nfld - NF)
				printf "Line: %5d is corrupted: %5d fields empty\n", NR, (nfld - NF)
			}
	}

	END {
		print "Total lines number:", lines
		print "Total fields number:", fields
		print "Total empty fields number:", empty_fields
		printf("Total sum: %.2f\n", sum)
	}









		
