#!/usr/bin/awk -f
	# VALIDATOR
	# module 1 - function check date - complete date validator 
		# detecting valid date format
		# identifying various date types: slash or dash separator, ddmm or dm format
		# detecting four-digit dates form the range 1000 to 2999   
	

function check_date(date, error_message,         parts, number_parts, day, month, year) {

	number_parts = split(date, parts, /[-\/]/)
	if (number_parts != 3) {
		error_message[1] = "WRONG STRUCTURE: expected 3 parts separated by - or /"
		return 0
	}
		
		if (length(parts[1]) == 4) {
			year = parts[1]
			month = parts[2]
			day = parts[3]
		}

	       	if (length(parts[3]) == 4) {
			day = parts[1]
			month = parts[2]
			year = parts[3]
		}

		if (year <= 1000 || year >= 2999) {
			error_message[1] = "INVALID YEAR FORMAT: year must be 4 digits from 1000 to 2999"
			return 0
		}

		if (month < 1 || month > 12) { 
			error_message[1] = "INVALID MONTH: allowed 1-12, got: "month""
			return 0
		}

		if (day < 1 ||  day > 31) { 
			error_message[1] = "INVALID DAY: allowed 1-31, got: "day""
		}

		if ((month == 4 || month == 6 || month == 9 || month == 11) && day > 30) {
			error_message[1] = "MONTH TOO SHORT: month "month" has only 30 days, got: "day""
			return 0
		}

		if (month == 2 && day > 29) { 
		       error_message[1] = "FEBRUARY TOO SHORT: February has max. 29 days, got: "day""
	       		return 0
		}

		if (month == 2 && day == 29) {
			if ((year % 4 != 0) || (year % 100 == 0 && year % 400 != 0)) {
				error_message[1] = "NOT A LEAP YEAR: year "year" is not a leap year, February has 28 days"
				return 0
			}

		}
		return 1
	}	
NR > 1 	{
		for (i = 1; i <= NF; i++) {
			if ($i ~ /[a-zA-Z]/) {
				continue
			}
		split("", errors)

			if (!check_date($i, errors)) { 
			printf("ALERT! Wrong date format: %-15s in line: %-5s field: %-5s %-5s\n", $i, NR, i,errors[1])
			}
		}
	}







	



