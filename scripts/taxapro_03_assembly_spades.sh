#!/usr/bin/env bash
# This script performs Metagenome Assembly
# Dependencies: SPAdes

cpus=24
ram=24

# Create variables
forward=$(ls ../fastqs/*_1.fastq)

#forward="../fastqs/*_1.fastq"
#reverse="../fastqs/*_2.fastq"
assembly_out="../test_assembled"

#Run SPAdes
mkdir -pv ${assembly_out}

echo "Now doing the metagenome assembly ..."

for i in $forward
do
	samplename=`basename -s '_1.fastq' $i`
	j=$(echo $i | sed 's/_1/_2/')
	metaspades.py --threads $cpus -m $ram -1 ${i} -2 ${j} -o ${assembly_out}/${samplename}
done

echo "Metaspades assembly completed for all files!"
