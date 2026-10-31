#!/usr/bin/awk -f

	# format_price - add $ sign to the price

	function format_price(x,      price) {
	
		sub(/,/, ".", x)
		price = sprintf("$%.2f", x)
		return price
	}
	{ 
		input[NR] = $0
		output[NR] = format_price($0)
	}
	END {
		for (i = 1; i <= NR; i++)
		print output[i]
	}


		






