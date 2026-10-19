#!/usr/bin/awk -f
		# counter 5 - counts the numbers of words stored in an array
		# input - rows of strings
		# output - the count of each unique word, ignoring case 

	
	{ 
		for (i = 1; i <= NF; i++) {
			if ($i !~ /[0-9]/) {
				word[tolower($i)]++
			}
		}
	}
	END { 
		print "The file ---", FILENAME, "--- contains the following words (count):"

			for (k in word) {
				printf ("%-10s %5d\n"), k, word[k]
				}
			}




