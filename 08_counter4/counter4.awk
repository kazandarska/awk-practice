#!/usr/bin/awk -f
		# counter 4 - counting distinct words in a file 
		# input - rows of strings
		# output - list of distinct words in the file
		
	{
		for (i = 1; i <= NF; i++) {
		# storing the word as a key in an array
		# assigning one creates that key

			word[$i] = 1
		}
	}

	END {
		print "The file ---", FILENAME, "--- contains the following words:"
		for (k in word) {
			print k
		}
	}




