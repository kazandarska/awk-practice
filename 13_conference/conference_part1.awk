#!/usr/bin/awk -f
	# conference part 1 - data validation using sub, tolower, toupper, arrays, getline and pipes
	# split semicolon-separated columns, validate the structure of each row
		# report the number of corrupted lines and missing fields 
	# segregate data into gropus using arrays
	# prepend proper prefixes to the groups
	# report current date and customizable backdate
	# sort data using a pipeline

	BEGIN {
		FS = ";"
	
		"date +%d-%m-%Y" | getline report_date
		close("date +%d-%m-%Y")
		printf("============================\n")
		printf("Report date: %10s\n", report_date)
		printf("============================\n")
		printf("Data structure: \n")

	}
	NR == 1 {
		nfld = NF
	}
	{	sub(/;$/, "")

		if (NF != nfld) { 
			empty_fields += (nfld - NF)
			printf("MISSING DATA: line: %2d has %2d fields instead of %2d\n", NR, NF, nfld)
		}
	}
	NR > 1 {
		name = toupper($1)
		sex = tolower($3)
		
		if (sex == "female") {
			prefix[name] = "Mrs"
		}
		else if (sex == "male") {
				prefix[name] = "Mr"
			}
	}
	END {	printf("\nThe following were invited to the conference (name, sent date):\n")
		"date -d '2 weeks ago' '+%d-%m-%Y'" | getline makeup_date
		close("date -d '2 weeks ago' '+%d-%m-%Y'")
		for (k in prefix) {
			printf("%-5s %10s %20s\n", prefix[k], k, makeup_date) | ("sort -k1,1")
		}
	}

		# ... to be continued 









	
	
