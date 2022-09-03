#/usr/bin/env bash

# This script uses Metaspages to assemble paired-end shotgun metagenomes
# Dependencies: Metaspades.py

cpus=30
ram=92

#Create variables
forward=$(ls ../fastqs/SRR1612416[89]*_1.fastq)
assembly_out="../assembled_test2"

#Run spades
mkdir -pv ${assembly_out}

echo "Now doing the metagenome assembly ..."

for fwd in $forward
do
        samplename=`basename -s '_1.fastq' $fwd`
        rev=$(echo $fwd | sed 's/_1/_2/')
        metaspades.py -m $ram --threads $cpus -1 ${fwd} -2 ${rev} -o ${assembly_out}/${samplename}
done

echo "Assembly completed for all files"
