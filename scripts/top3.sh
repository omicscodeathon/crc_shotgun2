#/usr/bin/env bash

# This script uses taxapro to perform shotgun metagenome assembly, orf prediction, taxonomy assignment and visualization
# Dependencies: taxapro

#Run spades

echo "Now generating the 3 most abundant microbes ..."

awk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10}' taxa_freq.csv | sort -n | tail -3 | sort -rn > taxa_freq_top3.tsv

echo "Top 3 most abundant microbes are now generated!"
