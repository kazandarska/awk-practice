#!/usr/bin/awk -f

	# generator 1 - generate random integers

	BEGIN {
		for (i = 1; i <= 200; i++) {

			print int(101*rand())
		} 
	}

