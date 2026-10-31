#!/usr/bin/awk -f 
	# discount - append a dollar sign to the price and two decimal places \
			# convert the amount into USD \ 
			# apply the discount for the given segment 



		function discount(price, type,       new_price) { 
			type = tolower($3)

				if (type == "premium") { 
					price = 0.85 * price 
				}

				new_price = price / 4.20 
				
				return sprintf("$%2.f", new_price) 
			} 
		
		{ 
			result = discount($2, $3)
			print $1, $3, result | ("column -t") 
		}



