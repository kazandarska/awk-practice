#!/usr/bin/awk -f

	BEGIN {
		FS = ";"				# setting the field separator to a semicolon, csv type
							# OFS unecessary, fmt present
	}
		NR > 1 {				# omitting the header
			c = $4				# setting c as a category of plants: fruit, vegetables, others
			if (c == "") {
				c = "others"		# creating 'others' as a 3rd category for blank fields
			}
			qty[c] += $2			
			value[c] += $2 * $3
			total_price[c] += $3
			record[c]++			# counting records for a given type (do not use scalar NR)
			tax[c] += $2 * $3 * ($5 / 100) 
		}
		END {
			fmt = "%-15s %-15s %-15s %-15s %-15s\n"
			fmt_data = "%-15s %-15d %-15.2f %-15.2f %-15.3f\n"
			
			printf fmt, "category", "quantity", "value", "average price", "tax"
			for (type in qty) {
				printf fmt_data, 
				       type,
				       qty[type],
				       value[type],
				       (total_price[type] / record[type]),
				       tax[type]
			}
		}



