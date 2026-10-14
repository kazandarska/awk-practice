# ==============================================================================
# SCRIPT NAME: awk1.sh
# DESCRIPTION: Computes row-by-row averages from numeric data using AWK.
#              Employs a 'for' loop to iterate over fields, utilizes 'NF' 
#              (Number of Fields) for the average calculation, handles data 
#              validation via conditional 'if-else' statements, and outputs 
#              the final results formatted to two decimal places (%.2f).
# DATA TYPE USED: .txt format
# DATA STRUCTURE: clean data, natural numbers, space-separated columns 
                  not transferred from Windows (LF)
# ==============================================================================

#!/bin/bash
plik="dane.txt"
if [ -f $plik ]; then
awk '{sum=0; for(i=1; i<=NF; i++) sum+=$i; srednia=sum/NF; printf "srednia wiersza: %.2f\n", srednia;

if (srednia > 30) {print "wartosc powyzej oczekiwanej"}
else if (srednia > 20) {print "wartosc graniczna"}
else {print "wartosc ponizej oczekiwanej"} }' $plik
else 
echo "Plik $plik nie istnieje"
fi
