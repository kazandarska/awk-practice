#!/usr/bin/awk -f
 	# addfilename - add filename to each nm output line
		# [nm.format from "AWK Programming Language" (ch.3/ p.74)]

	NF == 1 { file = $1 }
	NF == 2 { print file, $1, $2 }
	NF == 3 { print file, $2, $3 }

