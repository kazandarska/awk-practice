#!/usr/bin/awk -f
	# conference part 2 - data validation using sub, tolower, toupper, arrays, getline and pipes

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
			#empty_fields += (nfld - NF) 	# a concept that wasn't developed further:
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
		if ($2 < 18 && $2 != "") {
			under_18[++count] = $1
		}
		if ($2 >= 18 && $2 != "") {
			record[sex]++
			total_age[sex] += $2
		}

	}
	
	END {
		printf("\nThe following were invited to the conference (name, sent date):\n")
		if (count > 0) {
			printf("\nAlert! Minors were invited:\t")
			for (i = 1; i <= count; i++) {
				printf("%s\t", under_18[i])
			}
				printf("\n")
		}
		
		"date -d '2 weeks ago' '+%d-%m-%Y'" | getline makeup_date
		close("date -d '2 weeks ago' '+%d-%m-%Y'")
			
		for (k in prefix) {
			printf("%-5s %10s %20s\n", prefix[k], k, makeup_date) | ("sort -k1,1")
		}
		close("sort -k1,1")

		singular["female"] = "female"
		singular["male"] = "male"
		plural["female"] = "females"
		plural["male"] = "males" 

		for (x in record) {

		average_age[x] = (record[x] > 0) ? (total_age[x] / record[x]) : 0

		noun_form = (record[x] == 1) ? singular[x] : plural[x]
		
		printf("\nIn the conference will take part %d %s (including minors)\n", record[x], noun_form)

		printf("The average age of adult %-5s is %.1f\n", noun_form, average_age[x])
		}
		printf("\n")
	}

 	

	




	




	

	
		
	



	











	
	

