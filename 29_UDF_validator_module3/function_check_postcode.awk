#!/usr/bin/awk -f
	# VALIDATOR
	# module 3 - function check postcode - validate postal code 

		

	NR == 1 { 
			printf("---Starting analysis----the header ommitted\n")
			next
		}	

		function check_postcode(postcode, error_message) {
			postcode = postcode ""
		
		if (postcode ~ /^[[:space:]]*$/ || length(postcode) == 0) {
			error_message[1] = "EMPTY FIELD"
			return 0
		}
		if (postcode ~ /^[0]{2}-?[0]{3}$/) {
			error_message[1] = "INVALID FORMAT: all zeros are not allowed"
			return 0
		}
		if (postcode !~ /^[0-9]{2}-?[0-9]{3}$/) {
			error_message[1] = "INVALID FORMAT" 
			return 0
		}
		return 1
		}

		{
		
		split("", errors)
		
			if (!check_postcode($3, errors)) {
				printf("ALERT! line: %-5s %-5s\n", NR, errors[1])
			}
		}




