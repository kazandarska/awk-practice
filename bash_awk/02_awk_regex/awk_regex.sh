# ==============================================================================
# SCRIPT NAME: awk1_regex.sh
# DESCRIPTION: Filters rows starting with '30' and calculates the average
#              of the selected rows using the data from column 2.
# DATA TYPE USED: .txt format
# DATA STRUCTURE: clean data, naturals number, space-separated columns
				not transferred from Windows (LF)
# ==============================================================================

#!/bin/bash 
file="dane.txt"
if [ ! -f $file ]; then 
echo "file not found"
exit 1
 
else 
echo "File found. Searching..."
awk '/^30/ {
	row++;
	sum+=$2
}
END { if (row > 0) {print "average:", sum/row} 
else 
{print "Division by zero!"}
}' $file
fi
