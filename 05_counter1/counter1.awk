#!/usr/bin/awk -f
		# counter 1 - counting elements
			# input - rows of numbers and strings
			# output - the total number of strings

	{
		for (i = 1; i <= NF; i++) {
			if ($i ~ /[a-zA-Z]/) {
			string_count++
			}
		}
	}

	END {
		if (string_count > 0) {
			print "The file ---", FILENAME, "---contains:", string_count, "strings"
			}
	
		else {
			print "Strings not found in the file:", FILENAME
		}
	}


