#!/usr/bin/env bash

#This script performs metagenome assembly using metaspades
cpus=28
ram=120

#Create variables
forward=$(ls ../fastqs/crc_old/*_1.fastq)
assembly_out="../assembled/crc_old"

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
