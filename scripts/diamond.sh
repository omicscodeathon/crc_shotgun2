#!/usr/bin/env bash

#This script aligns assembled contigs using Diamond

#Create variables
input=$(ls -Ah /home/ruvarashe/my_shared_data_folder/crcshotgun/pipelines/taxapro_outdir/crc_old/)
output="../diamond_outdir/crc_old"
mkdir -pv ${output}

#Database
dmnd="/home/ruvarashe/my_shared_data_folder/crcshotgun/nr.dmnd"
cpus=24
percent_range=10
output_format=100
frameshift_penalty=15

#Running diaomond with blastx
for fasta in ${input}
do
	diamond blastx -q ${fasta}/assembly/contigs.fasta -d ${dmnd} -o ${output}/${fasta} -F ${frameshift_penalty} -f ${output_format} --range-culling --top ${percent_range} -p ${cpus}
done

echo "Diamond alignment completed for crc_old"
