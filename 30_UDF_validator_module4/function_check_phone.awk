#!/usr/bin/awk -f 
	# VALIDATOR
	# function check phone module 4 - validate phone numbers 

	BEGIN {
		FS = ","
	}
	NR == 1 {
		print "--- Starting analysis --- the header ommitted"
		next
	}
	function check_phone(phone, error_message,             only_number, asc, desc, wrong_seq) {
		phone = phone ""

		gsub(/[- +()]/, "", phone)

		if (phone == "") {
			error_message[1] = "EMPTY FIELD"
			return 0
		}
		if (phone ~ /[^0-9]/) {
			error_message[1] = "INVALID FORMAT: letters or special characters are not allowed"
			return 0
		}
		if (phone ~ /[0-9]{9}$/) {
			match(phone, /[0-9]{9}$/) 
			only_number = substr(phone, RSTART, RLENGTH)
			only_number = only_number ""
	
			if (only_number ~ /^9/) {
				error_message[1] = "INVALID FORMAT: beginning with 9 is not allowed"
				return 0
			}

			asc = "01234567890"
			desc = "98765432109"
			wrong_seq = "000000000 111111111 222222222 333333333 444444444 555555555 666666666 777777777 888888888"
			if (index(asc, only_number) > 0) {
				error_message[1] = "INVALID FORMAT: ascending sequence is not allowed"
				return 0
			}
			if (index(desc, only_number) > 0) {
				error_message[1] = "INVALID FORMAT: descending sequence is not allowed"
				return 0
			}
			if (index(wrong_seq, only_number) > 0) {
				error_message[1] = "INVALID FORMAT: sequence of identical digits is not allowed"
				return 0
			}
		}
		else {
			error_message[1] = "INVALID FORMAT: number is too short"
			return 0
		}
	return 1	
	}
		
	{
		split("", errors)
		if (!check_phone($4, errors)) {
			printf("ALERT in line: %-5s %-5s\n", NR, errors[1])
		}
	}	



		
