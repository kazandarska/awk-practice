#!/usr/bin/awk -f
		# VALIDATOR
		#  module 2 - function check pesel - check valid PESEL format

	function check_pesel(pesel, error_message)  {
		pesel ~ /^[0-9]{11}$/
	#	gsub(/[ \t-]+/, "", pesel)
 
			if (length(pesel) < 11) {
				error_message[1] = "FORMAT TOO SHORT: number must be 11 digits"
				return 0
			}

			if (length(pesel) > 11) {
				error_message[1] = "FORMAT TOO LONG: number must be 11 digits"
				return 0	
			}

			if (pesel ~ /^[0]{11}$/) {
				error_message[1] = "INVALID FORMAT: all zeros are not allowed" 
				return 0
			}
			return 1
		}
	
	NR > 1 {
			for ( i = 1; i <= NF; i++) {
				if ($i ~ /[a-zA-Z]/) {
					continue
				}
			split("", errors)
			if (!check_pesel($i, errors)) {
				printf("ALERT! line: %-5s field: %-5s: %-5s\n", NR, i, errors[1])
			}
		}
	}


