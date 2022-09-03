#/usr/bin/env bash

# This script uses sed to convert a comma-separated sample list to a tab-separated list for SqueezeMeta analysis
# Dependencies: sed

#Create variables
infile="../accessions/samplelist_crc_old.txt"
outfile="../accessions/sampleprep_crc_old.txt"

# Run the conversion command
sed 's/\,/\t/g' $infile > $outfile

echo "Sample conversion completed successfully!"
