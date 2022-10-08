crc_old <- loadSQM('~/my_shared_data_folder/crcshotgun/squeezemeta_out/crc_old/')
#taxa <- read.table('~/my_shared_data_folder/crcshotgun/squeezemeta_out/crc_old/results/06.crc_old.fun3.tax.wranks', header = TRUE, fill = TRUE)
#kegg <- read.table('~/my_shared_data_folder/crcshotgun/squeezemeta_out/crc_old/results/07.crc_old.fun3.kegg', fill = TRUE)
#Plotting taxonomy at the family level
tax_family <- plotTaxonomy(crc_old, rank = "family", count = "percent",
                           base_size = 6)
tax_family
tax_phylum_percent <- plotTaxonomy(crc_old, rank = "phylum", count = "percent",
                                   base_size = 6)
tax_phylum_percent
tax_fam_raw <- plotTaxonomy(crc_old, rank = "family", count = "abund",
                            base_size = 6)
tax_fam_raw
tax_phylum_raw <- plotTaxonomy(crc_old, rank = "phylum", count = "abund",
                               base_size = 6)
tax_phylum_raw
#To save plots make sure to load ggplot2 and save using ggsave(). Save plots as .png
ggsave(file = '~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/tax_family.png',
       plot = tax_family, width = 10, height = 8)
ggsave(file = '~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/tax_phylum_percent.png',
       plot = tax_phylum_percent,
       width = 9, height = 7)
ggsave(file = '~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/tax_fam_raw.png',
       plot = tax_fam_raw, width = 9, height = 7)
ggsave(file = 'tax_phylum_raw.png', plot = tax_phylum_raw, width = 9,
       height = 7)
#Collapse all unmapped and unclassified reads
tax_fam_ignore <- plotTaxonomy(crc_old, rank = "family", count = "percent",
                               base_size = 6, ignore_unmapped = TRUE,
                               ignore_unclassified = TRUE)
tax_fam_ignore
ggsave(file = '~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/tax_fam_ignore.png',
       plot = tax_fam_ignore, width = 9, height = 7)
tax_phylum_ignore <- plotTaxonomy(crc_old, rank = "phylum", count = "percent",
                                  base_size = 6, ignore_unmapped = TRUE,
                                  ignore_unclassified = TRUE)
tax_phylum_ignore
ggsave(file = '~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/tax_phylum_ignore.png',
       plot = tax_phylum_ignore, width = 9, height = 7)
#Functions of taxa
kegg <- plotFunctions(crc_old, fun_level = "KEGG", count = "tpm",
                      base_size = 6)
kegg

#Subsetting for Fusobacteria
fusobacteria <- subsetTax(crc_old, rank = 'phylum', tax = 'Fusobacteria',
                          rescale_copy_number = F)
fusobacteria
fusobacteria_genus <- plotTaxonomy(fusobacteria, rank = 'genus', count = 'percent',
                                   base_size = 6, rescale = T)
fusobacteria_genus
ggsave(file = '~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/fusobacteria_genus.png',
       plot = fusobacteria_genus, width = 9, height = 7)
#plotting for fusobacteria species
fusobacteria_species <- plotTaxonomy(fusobacteria, rank = 'species', count = 'percent',
                                     base_size = 6, rescale = T)
fusobacteria_species
ggsave(file = '~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/fusobacteria_species.png',
       plot = fusobacteria_species, width = 9, height = 7)

#Akkermansiaceae
akker <- subsetTax(crc_old, rank = 'family', tax = 'Akkermansiaceae',
                   rescale_copy_number = F)
akker
##Plotting for genus
akker_genus <- plotTaxonomy(akker, rank = 'genus', count = 'percent',
                            base_size = 6, rescale = T)
akker_genus
ggsave(file = '~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/akker_genus.png',
       plot = akker_genus, width = 9, height = 7)

##plotting fpr akker species
akker_species <- plotTaxonomy(akker, rank = 'species', count = 'percent',
                              base_size = 6, rescale = T)
akker_species
ggsave(file = '~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/akker_species.png',
       plot = akker_species, width = 9, height = 7)
ggsave(file = '~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/kegg.png',
       plot = kegg, width = 9, height = 7)
cog <- plotFunctions(crc_old, fun_level = "COG", count = "tpm",
                     base_size = 6)
cog
ggsave(file = '~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/cog.png',
       plot = cog, width = 9, height = 7)
pfam <- plotFunctions(crc_old, fun_level = "PFAM", count = "tpm",
                      base_size = 6)
pfam
ggsave(file = '~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/pfam.png',
       plot = pfam, width = 9, height = 7)
saveRDS(crc_old, file = "~/my_shared_data_folder/crcshotgun/crc_old.RDS")

#Creating a table

table <- crc_old$taxa$phylum$abund
table
table_subset <- table[c('Bacteroidetes', 'Firmicutes', 'Verrucomicrobia', 'Proteobacteria',
                        'Unclassified Bacteria','Actinobacteria', 'Fusobacteria',
                        'Chordata','Streptophyta', 'Synergistetes', 'Uroviricota', 'Unclassified Viruses'),]
table_subset

table_df <- data.frame(table_subset) #Set table to a dataframe
table_df
#Calculating the means for each phlum
crc_old_mean <- rowMeans(table_df)
crc_old_mean
crc_mean_df <- data.frame(crc_old_mean)
crc_mean_df
exportTable(table, "~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/crc_old_table.txt")
exportTable(crc_mean_df, "~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/crc_old.txt")
#Table for families
table_fam <- crc_old$taxa$family$abund
table_fam
table_fam_crc_old <- table_fam[c('Bacteroidaceae', 'Akkermansiaceae', 'Veillonellaceae', 'Unclassified Eubacteriales',
                                 'Oscillospiraceae', 'Selenomonadaceae', 'Lachnospiraceae',
                                 'Unclassified Bacteroidales', 'Rikenellaceae', 'Eggerthellaceae',
                                 'Lactobacillaceae', 'Prevotellaceae', 'Fusobacteriaceae', 'Rikenellaceae',
                                 'Tannerellaceae', 'Coriobacteriaceae'), ]
table_fam_crc_old
table_fam_crc_old_df <- data.frame(table_fam_crc_old)
exportTable(table_fam_crc_old, "~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/table_fam_crc_old.txt")
fam_mean <- rowMeans(table_fam_crc_old_df)
fam_mean_crc_old <- data.frame(fam_mean)
exportTable(fam_mean_crc_old, "~/my_shared_data_folder/crcshotgun/sqm_crc_old_plots/fam_mean_crc_old.txt")



