#!/usr/bin/awk -f 
	# format price 2 - add dollar sign and two decimal places to the price, replace commas with periods
		# input: three rows of integers or decimal numbers, separated by tabs
		# formatted price with dollar sign at the beginning, two decimal places

	BEGIN {
		FS = "\t"
		OFS = "\t\t"
	}
	
	function format_price(x,     price) {
		sub(/,/, ".", x)
		price = sprintf("$%.2f", x)
		return price
	}
	{
		for (i = 1; i <= NF; i++) {
			$i = format_price($i)
		}
		print $0
	}


