#/usr/bin/env bash

# This script uses sed to convert a comma-separated sample list to a tab-separated list for SqueezeMeta analysis
# Dependencies: sed

#Create variables
infile1="../accessions/samplelist_crc_old.txt"
outfile1="../accessions/sampleprep_crc_old.tsv"

infile2="../accessions/samplelist_healthy_old.txt"
outfile2="../accessions/sampleprep_healthy_old.tsv"

infile3="../accessions/samplelist_crc_young.txt"
outfile3="../accessions/sampleprep_crc_young.tsv"

infile4="../accessions/samplelist_healthy_young.txt"
outfile4="../accessions/sampleprep_healthy_young.tsv"

# Run the conversion command
sed 's/\,/\t/g' $infile1 > $outfile1

echo "Sample conversion completed successfully!"
