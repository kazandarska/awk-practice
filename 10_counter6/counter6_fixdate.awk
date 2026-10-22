#!/usr/bin/awk -f
		# counter 6 (fix date) - mult-dimensional data filtering with arrays 
		# count2.data
		# filtered data: selected March transactions for a specific group
				# volume and total value of sales and purchases
				
BEGIN {				# fixed the date entry method (getline inst.of system)
	"date +%Y-%m-%d" | getline report_date
	close("date +%Y-%m-%d")
	printf("======================================================\n")
	printf("Report date: %30s\n", report_date)
	printf("======================================================\n")
	printf("REPORT: summary of March purchases, sales, quantity\n")
}
	# ommit the header
NR > 1	{
	# select from col.5 only March transactions
		if ($5 !~ /[0-9]{2}-[03]/) {next}
	# ignore case in col.10
		person = tolower($10)
	# select specific gropus with excluding others 	
		if (person != "seller" && person != "buyer") {next}

			value[person] += $6 * $9
			total_price[person] += $9
			quantity[person] += $6
			record[person]++ 
	}

	
END {
	fmt = "%-15s %-15s %-15s %-15s\n"
	fmt_data = "%-15s %-15d %-15.2f %-15.2f\n"
	
	printf fmt, "person", "quantity", "value", "average price"
		for (k in quantity) {
			printf fmt_data, 
			       k,
			       quantity[k],
			       value[k],
				# handles division by zero	       
			       average_price = (record[k] > 0) ? (total_price[k] / record[k]) : 0
		}
	}




