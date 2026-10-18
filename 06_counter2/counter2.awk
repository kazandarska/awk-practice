#!/usr/bin/awk -f
		# counter 2 - count the total fields with dates
			# input - rows of numbers and strings (inc. dates and time)
			# output - the total of fields with dates

	BEGIN {
		FS = "\t"
	}
	{
		for (i = 1; i <= NF; i++) {
			if ($i ~ /[0-9]{2}-[0-9]{2}[-0-9]?/) {
				date_count++
			}
		}
	}
	END {
		if (date_count > 0) {
			print "The file ---", FILENAME, "--- contains:", date_count, "dates"
		}
		else {
			print "Dates not found in the file ----", FILENAME 
		}
	}

