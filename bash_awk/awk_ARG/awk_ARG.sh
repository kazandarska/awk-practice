#!/usr/bin/awk -f

	BEGIN {
		plik="/home/angelhoff/dane.txt"
		ARGV[1]=plik
		ARGC=2
	print "uruchamiam"
	} 
	{print $2}


