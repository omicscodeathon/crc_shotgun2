#/usr/bin/env bash

# This script uses taxapro to perform shotgun metagenome assembly, orf prediction, taxonomy assignment and visualization
# Dependencies: taxapro

cpus=28
ram=88

#Create variables
forward=$(ls ../fastqs/crc_old/SRR1612431[12]*_1.fastq)
taxapro_out="taxapro_outdir"

#Run spades

echo "Now Running the Taxapro Pipeline ..."

for fwd in $forward
do
        samplename=`basename -s '_1.fastq' $fwd`
        mkdir -pv ${taxapro_out}/${samplename}
        rev=$(echo $fwd | sed 's/_1/_2/')
        python3 taxapro_install/taxapro.py -f ${fwd} -r ${rev} -o ${taxapro_out}/${samplename}
done

echo "Analysis with Taxapro Pipeline is now completed for all metagenomes!"
