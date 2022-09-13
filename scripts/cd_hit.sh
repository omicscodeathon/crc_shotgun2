#!/usr/bin/env bash

#This script removes redundant genes using cd-hit-est

cpus=24
ram=88

input=$(ls -Ah /home/ruvarashe/my_shared_data_folder/crcshotgun/assembled/crc_old/)
#input="../assembled/crc_old/SRR*/contigs.fasta"
output="../cd_hit_out/crc_old"

mkdir -pv  ${output}

for i in $input
do
       cd-hit-est -i $i/contigs.fasta -o $output/$i -c 0.90 -n 9 -d 0
done

echo "cd-hit analysis complete for all samples"
