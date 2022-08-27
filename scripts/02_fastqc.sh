#/usr/bin/env bash

# This script performs fastqc and multiqc on fastq files

cpus=8

datafiles="../fastqs/*.fastq"

outdir_fastqc="../fastqc_reports"
outdir_multiqc="../multiqc_reports"

echo
echo "Now creating the required reports directories ..."
mkdir -pv $outdir_fastqc
mkdir -pv $outdir_multiqc

for datafile in $datafiles
 do
  fastqc -o $outdir_fastqc $datafile
 done

echo "Fastqc processing completed for all Fastq files"

multiqc -o $outdir_multiqc $outdir_fastqc

echo "Multiqc processing completed"
