#!/usr/bin/awk -f
 	# masking data - masking sensitive data
	
	BEGIN {
		FS = "[\t]+"
	}
	
	NR > 1	{
		phone_start = substr($2,1,3)
		phone_end = substr($2,7,3)

		printf("%-10s %s %s %s\n", $1, phone_start,"***",phone_end)
	}

