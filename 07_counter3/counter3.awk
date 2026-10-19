#!/usr/bin/awk -f
		# counter 3 - word count matching a pattern
			# input - rows of numbers and strings
			# output - the total number of occurrences of the given word 


	{
		for (i = 1; i <= NF; i++) {
			if ($i ~ /senna/)
				count_word1++
				
			if ($i ~ /none/) 
				count_word2++
			}
		}

		
			
	END {
		if (count_word1 > 0) {
			print "In the file ---", FILENAME, "--- word - senna - is found", count_word1, "times"
		}
		if (count_word2 > 0) {
			print "In the file ---", FILENAME, "--- word - none - is found", count_word2, "times"
		}
		else {
			print "Searching word do not exist"
		}
	}



