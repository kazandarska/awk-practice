#!/usr/bin/awk -f
		# counter 7 - case-insensitive data filtering using arrays 
		# input - count2.data
		# output - creating a report for filtered data 
BEGIN {
	printf("============================================\n")
	print "LOSS SUMMARY REPORT:"; system("date +%Y-%m-%d")
	printf("============================================\n")
}
NR > 1 {
	who = tolower($10) 

		qty[who] += $6
		value[who] += $6 * $9
	
	}
	END {  
		for (k in value) {
			printf("%-10s | %-10d pcs. | %-10.2f $\n", k, qty[k], value[k]) 
		}
		printf("====================================\n")
		s_qty = qty["seller"]
		b_qty = qty["buyer"]
		n_qty = qty["none"]

		loss_qty = s_qty - (b_qty + n_qty)
		
		printf("LOSS ANALYSIS (IN UNITS):\n")
		printf("Current loss:\t %-10d pcs.\n"), n_qty
		printf("Total loss:\t %-10d pcs.\n"), loss_qty
		
		(loss_qty > 100) 
			printf("==============================\n")
			printf("ALERT: loss %d pcs.\n", loss_qty)

	}








