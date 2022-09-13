#/usr/bin/env bash

# This script uses co-assembly method of the SqueezeMeta pipeline to
# generate final outputs of for paired-end shotgun metagenomic samples
# Dependencies: SqueezeMeta

cpus=30
#ram=120
# When RAM is specified in the command, SqueezeMeta expects an Integer which is the available RAM divided by 8
#ram_squeezemeta=$(expr $ram \/ 8)

#Create variables

# 4 Groups
# crc_old, healthy_old, crc_young, healthy_young

infile1="../accessions/sampleprep_crc_old.tsv"
infile2="../accessions/sampleprep_healthy_old.tsv"
infile3="../accessions/sampleprep_crc_young.tsv"
infile4="../accessions/sampleprep_healthy_young.tsv"

fastq_dir="../fastqs"
squeezemeta_dir="../squeezemeta_out"

mkdir -pv $squeezemeta_dir

patient_old_dir=${squeezemeta_dir}/crc_old
patient_young_dir=${squeezemeta_dir}/crc_young
healthy_old_dir=${squeezemeta_dir}/healthy_old
healthy_young_dir=${squeezemeta_dir}/healthy_young

# Run the analysis command using SqueezeMeta on group1
#/opt/SqueezeMeta-1.5.2/scripts/SqueezeMeta.pl -t $cpus -m coassembly -p $patient_old_dir -s $infile1 -f $fastq_dir

# Run the analysis command using SqueezeMeta on group2
/opt/SqueezeMeta-1.5.2/scripts/SqueezeMeta.pl -t $cpus -m coassembly -p $healthy_old_dir -s $infile2 -f $fastq_dir

# Run the analysis command using SqueezeMeta on group3
#/opt/SqueezeMeta-1.5.2/scripts/SqueezeMeta.pl -t $cpus -b $ram_squeezemeta -m coassembly -p $patient_young_dir -s $infile3 -f $fastq_dir

# Run the analysis command using SqueezeMeta on group4
#/opt/SqueezeMeta-1.5.2/scripts/SqueezeMeta.pl -t $cpus -b $ram_squeezemeta -m coassembly -p $healthy_young_dir -s $infile4 -f $fastq_dir

echo "Shotgun Metagenomic data analysis with SqueezeMeta completed for all healthy old samples"
