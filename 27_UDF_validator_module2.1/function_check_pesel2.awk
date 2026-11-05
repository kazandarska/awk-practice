#!/usr/bin/awk -f
		# VALIDATOR
		# module 2.1 - function check pesel 2 - check valid PESEL format using weighted modulo 10 checksum
		# pesel <=> RRMMDDSSSPX
			# sum = (1*R) + (3*R) + (7*M) + (9*M) + (1*D) + (3*D) + (7*S) + (9*S) + (1*S) + (3*P) + (1*X)
			# (sum % 10) == 0 --> valid 
	
	BEGIN {
		FS = ","
	}

	NR == 1 { 
			printf("---Starting analysis----the header ommitted\n") 
				next 
		}

	function check_pesel(pesel, error_message,        digit, wages, i)  {
			
		# gsub(/[ \t-]+/, "", pesel) --> remove white characters or - if number was copied 

			if (pesel == "") {
				error_message[1] = "EMPTY FIELD"
				return 0
			}
			if (pesel ~ /[a-zA-Z]/) {
				error_message[1] = "INVALID CHARACTERS: allowed digits only"
				return 0
			} 
			if (pesel ~ /^[0]{11}$/) {
				error_message[1] = "INVALID FORMAT: all zeros are not allowed"
				return 0
			}
			if (length(pesel) < 11) {
				error_message[1] = "FORMAT TOO SHORT: number must be 11 digits"
				return 0
			}
			if (length(pesel) > 11) {
				error_message[1] = "FORMAT TOO LONG: number must be 11 digits"
				return 0	
			}

			split(pesel, digit, "") 
			split("1 3 7 9 1 3 7 9 1 3 1", wages, " ")

			sum = 0 
			for (i = 1; i <= 11; i++) {
			sum += digit[i] * wages[i]
			}
				if ((sum % 10) != 0) {
					error_message[1] = "INVALID NUMBER: number does not exist"
					return 0
				}
			return 1
		}
		{
			split("", errors)
			
			if (!check_pesel($2, errors)) {
				printf("ALERT! line: %-5s %-5s\n", NR, errors[1])
			}
		}

		
	





