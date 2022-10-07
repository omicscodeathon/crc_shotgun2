#Loading necessary packages
library('SQMtools')
library('ggplot2')
#Creating SQM object
healthy_young <- loadSQM("~/my_shared_data_folder/crcshotgun/squeezemeta_out/healthy_young")
View(healthy_young)
#Generate tables for taxa relative abundance based on percentage
taxa_fam_table <- healthy_young$taxa$family$percent
View(taxa_fam_table)
#Based on abundance
fam_table_abund <- healthy_young$taxa$family$abund
View(fam_table_abund)
#Reorder columns in descending order
#Plotting for taxa
taxa_fam <- plotTaxonomy(healthy_young, rank = "family", count = "percent",
                         base_size = 6)
taxa_fam
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/taxa_fam.png', plot = taxa_fam, width = 9, height = 7)
taxa_fam_clean <- plotTaxonomy(healthy_young, rank = "family", count = "percent",
                               base_size = 6, ignore_unmapped = TRUE,
                               ignore_unclassified = TRUE)
taxa_fam_clean
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/taxa_fam_clean.png',
       plot = taxa_fam_clean, width = 9, height = 7)
#Plotting for phylum
phylum <- plotTaxonomy(healthy_young, rank = "phylum", count = "percent", base_size = 6)
phylum
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/phylum.png',
       plot = phylum, width = 9, height = 7)
phylum_clean <- plotTaxonomy(crc_young, rank = "phylum", count = "percent",
                             base_size = 6, ignore_unmapped = TRUE,
                             ignore_unclassified = TRUE)
phylum_clean
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/phylum_clean.png',
       plot = phylum_clean, width = 9, height = 7)
#Plotting most abundant taxa
most_abund <- plotTaxonomy(healthy_young, rank = "phylum", count = "percent",
                           tax = c("Bacteroidetes", "Firmucutes", "Proteobacteria"),
                           base_size = 10, others = F, rescale = F)
#Functional potential
#KEGG
kegg <- plotFunctions(healthy_young, fun_level = "KEGG", count = "tpm", base_size = 5)
kegg
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/kegg.png',
       plot = kegg, width = 8, height = 6)
saveRDS(healthy_young, file = "~/my_shared_data_folder/crcshotgun/")
#COG
cog <- plotFunctions(healthy_young, fun_level = "COG", count = "tpm", base_size = 6)
cog
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/cog.png',
       plot = cog, width = 8, height = 6)
#PFAM
pfam <- plotFunctions(healthy_young, fun_level = "PFAM", count = "tpm", base_size = 6)
pfam
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/pfam.png',
       plot = pfam, width = 8, height = 6)
#Exploring the most common taxa bacteroidetes
bactero <- subsetTax(healthy_young, 'phylum', tax = 'Bacteroidetes', 
                     rescale_copy_number = F)
bactero_view <- plotTaxonomy(bactero, 'genus', 'percent', N = 10, rescale = T,
                             others = F, base_size = 6)
bactero_view
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/bacteroidetes.png',
       plot = bactero_view, width = 9, height = 7)
#Functional profile of the Bacteroidetes
bact_fun <- plotFunctions(bactero, fun_level = 'KEGG', count = 'copy_number',
                          base_size = 6)
bact_fun
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/kegg_bact.png',
       plot = bact_fun, width = 8, height = 6)
#Exploring Firmicutes
firm <- subsetTax(healthy_young, 'phylum', tax = 'Firmicutes',
                  rescale_copy_number = F)
firm_view <- plotTaxonomy(firm, 'genus', 'percent', N = 10, rescale = T,
                          others = F, base_size = 6)
firm_view
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/firmicutes.png',
       plot = firm_view, width = 9, height = 7)
#Firmicutes functional profile
firm_fun <- plotFunctions(firm, fun_level = 'KEGG', count = 'copy_number',
                          base_size = 6)
firm_fun
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/firmicutes_fun.png',
       plot = firm_fun, width = 8, height = 6)
#Visualizations for bins
bin_table <- healthy_young$bins$table
View(bin_table)
typeof(bin_table)
typeof(taxa_fam_table)
str(bin_table)
head(bin_table)
select(bin_table, Tax, Length, Disparity) #To be completed
