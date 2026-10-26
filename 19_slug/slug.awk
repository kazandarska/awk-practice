#!/usr/bin/awk -f 
		# slug - slug generation

	{ 
		gsub(/ /, "-", $0) 
		gsub(/!$/, "", $0)
		
		slug = substr($0,1,60)

		print tolower(slug)

	}

