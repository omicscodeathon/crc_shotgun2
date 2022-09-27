#!/usr/bin/env bash

#This script downloads the latest NCBI-nr database and builds a DIAMOND index

#First downloading NCBI-nr database 
cd /home/ruvarashe/my_shared_data_folder/crcshotgun 
wget https://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/nr.gz

#Building diamond index

diamond makedb --in nr.gz --db nr

echo "Build complete"


