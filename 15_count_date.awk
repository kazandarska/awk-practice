#!/usr/bin/awk -f  
		# count_date 1 - date arithmetic, calculating the period between two dates
		

	BEGIN { 
		start = mktime("1990 10 05 12 00 05") 
		end = mktime("2022 05 30 16 12 45")

		total_seconds = end - start

	# -----YEARS-------- 
	# 1 year = 31557600 seconds
		years = int(total_seconds / 31557600)
		seconds_left = total_seconds % 31557600	

	# -----MONTHS-------
	# 1 month = 2629800 seconds
		months = int(seconds_left / 2629800)
		seconds_left = seconds_left % 2629800

	# -----DAYS-----------
	# 1 day = 86400 seconds
		days = int(seconds_left / 86400)
		seconds_left = seconds_left % 86400

	#------HOURS---------
	# 1 hour = 3600 seconds
		hours = int(seconds_left / 3600)
		seconds_left = seconds_left % 3600

	# ------MINUTES-------
	# 1 minute = 60 seconds
		minutes = int(seconds_left / 60)

	# -----SECONDS--------
		seconds = seconds_left % 60



		printf("The period between the two dates is:\n")
	       	printf("%d years %d months %d days %d hours %d minutes %d seconds\n",
		       years, months, days, hours, minutes, seconds)

		exit
	}



