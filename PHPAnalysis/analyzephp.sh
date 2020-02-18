#!/bin/csh

# Analyze all of the Makefiles that can be found in the provided directory tree
# Jim Cordy, École Polytechnique, April 2014

# The original file was modified to work with PHP analysis
# Ashiqur Rahman, School of Computing, Queen's University, April 2017

# Revised to convert to CSV spreadsheet as well - JRC 6.2.2017

# Usage:    analyzemakes DIR 
#	    (output in DIR.makeanalysis, DIR.makeanalysis.csv)

unlimit stacksize

# Check argument
if (! -d $1) then
    echo "Usage:  analyzephp DIR"
    echo "  (where DIR is a directory tree containing phpfiles named using .php)"
    exit 99
endif

# Find phpfiles (now only those named *.php)
echo -n > ${1}.phpanalysis
#foreach i (`find $1 -type f | egrep -e "Makefile*" -e "_Kbuild" -e "*.make" -e "*.mk" -e "*rule*" -e "*Rule*"`)
foreach i (`find ${1} -type f | egrep -e ".php" -e ".PHP" -e ".Php"`)
    echo -n "."
    echo "=== $i ===" >> ${1}.phpanalysis
    txl -q $i ../TXL/phpanalysis.txl -s 400 -o /dev/null >>& ${1}.phpanalysis
end
echo ""

# Convert result to spreadsheet
ruby tools/2spreadsheet.rb < ${1}.phpanalysis > ${1}.phpanalysis.csv

echo "PHP Analysis Done."
echo "Output in ${1}.phpanalysis, ${1}.phpanalysis.csv"
#echo "Output in ${1}.phpanalysis"
