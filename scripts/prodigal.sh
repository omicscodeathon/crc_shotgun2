#!/usr/bin/env bash

#This script does gene prediction using prodigal

cpus=24
ram=88

input=$(ls -Ah ../taxapro_outdir/crc_old/ | grep SRR16124311)
fasta="../taxapro_outdir/crc_old"
#input="../assembled/crc_old/SRR16124311/contigs.fasta"
output="../prodigal/crc_old"
aacid="contigs.aa.fasta"
genes="contigs.gff"
nucleotides="contigs.nuc.fasta"

mkdir -pv  ${output}

for i in $input
do
	mkdir -pv ${output}/${i}
	touch ${output}/${i}/${aacid}
	touch ${output}/${i}/${genes}
	touch ${output}/${i}/${nucleotides}	
        prodigal -i ${fasta}/${i}/assembly/contigs.fasta -d ${output}/${i}/${nucleotides} -a ${output}/${i}/${aacid} -f gff -p meta -o ${output}/${i}/${genes}
done

echo "prodigal analysis complete for crc old group"


