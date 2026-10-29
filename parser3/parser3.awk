#!/usr/bin/awk -f 
	# parser 3 - processing data in a mess: inconsistent field separators, missing fields and entire lines  
		# reporting: empty lines, total number of lines incl. corrupted ones, 
				# number of fields contained in the reference line
				# which corrupted line contains how many fields   

	BEGIN {
		FS = "[; \t]+"
		OFS = "\t"

		printf("==============================\n")
		"date +%d-%m-%Y" | getline report_date
		close("date +%d-%m-%Y")
		printf("REPORT DATE: %10s\n", report_date)
		printf("==============================\n")

	}
	NR == 1 { 
		nfld = NF
	}
	{
		gsub(/;$/, "")

		if (NF != nfld) {
			corrupted_line = NR		
			fields[NR] = NF
			corrupted_lines++
		}
		if ($i !~/[a-zA-Z|0-9]/ || $i == "") {
			printf("ALERT! The line %2s contains no data\n", NR)
		
		}
	}
	END {
		printf("==============================\n")
		printf("The file ---%s--- consists of %d records, inculding %d corrupted ones\n\n", FILENAME, NR, corrupted_lines)
		printf("The reference line contains %d fields\n\n", nfld)
		printf("The following records have an invalid number of fields:\n")
			for (k in fields)
	       		printf("Record no. %2d has %2d fields\n", k, fields[k])
	}
	



	





		





