#!/usr/bin/awk -f
		# make_id - concatenate strings

	NR > 1 	{
			name = substr($1,1,1)
			surname = substr($2,1,1)
			id = substr($3,1,5)

			printf("%-10s %-10s\n", $1, tolower(name surname "_" id))
	}

