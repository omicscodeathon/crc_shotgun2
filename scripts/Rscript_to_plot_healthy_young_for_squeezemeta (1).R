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
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/taxa_fam.png', plot = taxa_fam, width = 9, height = 7)#saving the plot
#ignoring unclassified and unmapped
taxa_fam_clean <- plotTaxonomy(healthy_young, rank = "family", count = "percent",
                               base_size = 6, ignore_unmapped = TRUE,
                               ignore_unclassified = TRUE)
taxa_fam_clean
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/taxa_fam_clean.png',
       plot = taxa_fam_clean, width = 9, height = 7)#saving the plot
#Plotting for phylum
phylum <- plotTaxonomy(healthy_young, rank = "phylum", count = "percent", base_size = 6)
phylum
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/phylum.png',
       plot = phylum, width = 9, height = 7)
#ignoring the unmapped and unclassified
phylum_clean <- plotTaxonomy(healthy_young, rank = "phylum", count = "percent",
                             base_size = 6, ignore_unmapped = TRUE,
                             ignore_unclassified = TRUE)
phylum_clean
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/phylum_clean.png',
       plot = phylum_clean, width = 9, height = 7)#saving the plot

#Functional potential
#KEGG
kegg <- plotFunctions(healthy_young, fun_level = "KEGG", count = "tpm", base_size = 5)
kegg
ggsave(file = '~/my_shared_data_folder/crcshotgun/healthy_young_plots/kegg.png',
       plot = kegg, width = 8, height = 6)
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
#creating table

table=healthy_young$taxa$phylum$abund

bacteroidetes_table1=table[c('Bacteroidetes','Firmicutes','Proteobacteria','Uroviricota','Actinobacteria','Chordata','Streptophyta','Verrucomicrobia','Synergistetes','Apicomplexa'),]#we select the bacteras that were more abundant
bacteroidetes_table1
table_data=data.frame(bacteroidetes_table1)
table_data
phylum_healthy_young=rowMeans(table_data)#we calculate the mean of the samples we have
phylum_healthy_young=data.frame(phylum_healthy_young)
View(phylum_healthy_young)#this table contains the average of all the samples of healthy old for the bacteras selected
exportTable(phylum_healthy_young, '~/my_shared_data_folder/crcshotgun/healthy_young_plots/phylum_healthy_young.txt')
