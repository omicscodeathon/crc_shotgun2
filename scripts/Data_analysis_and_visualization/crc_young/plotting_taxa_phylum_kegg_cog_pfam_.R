#Loading necessary packages
library('SQMtools')
library('ggplot2')
#Creating SQM object
crc_young <- loadSQM("~/my_shared_data_folder/crcshotgun/squeezemeta_out/crc_young")
View(crc_young)
#Generate tables for taxa relative abundance based on percentage
taxa_fam_table <- crc_young$taxa$family$percent
View(taxa_fam_table)
#Based on abundance
fam_table_abund <- crc_young$taxa$family$abund
View(fam_table_abund)
#Reorder columns in descending order
#Plotting for taxa
taxa_fam <- plotTaxonomy(crc_young, rank = "family", count = "percent",
                         base_size = 6)
taxa_fam
ggsave(file = '~/my_shared_data_folder/crcshotgun/crc_young_plots/taxa_fam.png', plot = taxa_fam, width = 9, height = 7)
taxa_fam_clean <- plotTaxonomy(crc_young, rank = "family", count = "percent",
                               base_size = 6, ignore_unmapped = TRUE,
                               ignore_unclassified = TRUE)
taxa_fam_clean
ggsave(file = '~/my_shared_data_folder/crcshotgun/crc_young_plots/taxa_fam_clean.png',
       plot = taxa_fam_clean, width = 9, height = 7)
#Plotting for phylum
phylum <- plotTaxonomy(crc_young, rank = "phylum", count = "percent", base_size = 6)
phylum
ggsave(file = '~/my_shared_data_folder/crcshotgun/crc_young_plots/phylum.png',
       plot = phylum, width = 9, height = 7)
phylum_clean <- plotTaxonomy(crc_young, rank = "phylum", count = "percent",
                             base_size = 6, ignore_unmapped = TRUE,
                             ignore_unclassified = TRUE)
phylum_clean
ggsave(file = '~/my_shared_data_folder/crcshotgun/crc_young_plots/phylum_clean.png',
       plot = phylum_clean, width = 9, height = 7)
#Plotting most abundant taxa
most_abund <- plotTaxonomy(crc_young, rank = "phylum", count = "percent",
                           tax = c("Bacteroidetes", "Firmucutes", "Proteobacteria"),
                           base_size = 10, others = F, rescale = F)
#Functional potential
#KEGG
kegg <- plotFunctions(crc_young, fun_level = "KEGG", count = "tpm", base_size = 5)
kegg
ggsave(file = '~/my_shared_data_folder/crcshotgun/crc_young_plots/kegg.png',
       plot = kegg, width = 8, height = 6)
saveRDS(crc_young, file = "~/my_shared_data_folder/crcshotgun/")
#COG
cog <- plotFunctions(crc_young, fun_level = "COG", count = "tpm", base_size = 6)
cog
ggsave(file = '~/my_shared_data_folder/crcshotgun/crc_young_plots/cog.png',
       plot = cog, width = 8, height = 6)
#PFAM
pfam <- plotFunctions(crc_young, fun_level = "PFAM", count = "tpm", base_size = 6)
pfam
ggsave(file = '~/my_shared_data_folder/crcshotgun/crc_young_plots/pfam.png',
       plot = pfam, width = 8, height = 6)
