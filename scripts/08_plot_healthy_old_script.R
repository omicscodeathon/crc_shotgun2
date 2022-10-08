

################################# healthy old ##########################################################
library("SQMtools")
health_old <- loadSQM('~/my_shared_data_folder/crcshotgun/squeezemeta_out/healthy_old/')
health_old
saveRDS(health_old, file = "~/my_shared_data_folder/crcshotgun/health_old.RDS")
library("ggplot2")
#count
help("plotTaxonomy")
healthy_old_family= plotTaxonomy(health_old, rank='family', count='percent',base_size = 6,ignore_unmapped = T,
                                 ignore_unclassified = T,max_scale_value = 100)
ggsave(file='~/my_shared_data_folder/crcshotgun/plots/healthy_old_family.png', plot = healthy_old_family, width=9, height=7) #png
healthy_old_phylum= plotTaxonomy(health_old, rank='phylum', count='percent',base_size = 6,ignore_unmapped = T,
                                 ignore_unclassified = T,max_scale_value = 100)
healthy_old_phylum
ggsave(file='~/my_shared_data_folder/crcshotgun/plots/healthy_old_phylum.png', plot = healthy_old_phylum, width=9, height=7) #png
#abundant
healthy_old_family_abund= plotTaxonomy(health_old, rank='family', count='abund',base_size = 6,ignore_unmapped = T,
                                       ignore_unclassified = T)
ggsave(file='~/my_shared_data_folder/crcshotgun/plots/healthy_old_family_abund.png', plot = healthy_old_family_abund, width=9, height=7) #png
healthy_old_phylum_abund= plotTaxonomy(health_old, rank='phylum', count='abund',base_size = 6,ignore_unmapped = T,
                                       ignore_unclassified = T,  max_scale_value = 100)
ggsave(file='~/my_shared_data_folder/crcshotgun/plots/healthy_old_phylum_abund.png', plot = healthy_old_phylum_abund, width=9, height=7) #png

#kegg tpm
healthy_old_kegg= plotFunctions(health_old, fun_level = 'KEGG', count = 'tpm', N = 15,base_size = 6)
ggsave(file='~/my_shared_data_folder/crcshotgun/plots/healthy_old_kegg.png', plot = healthy_old_kegg, width=9, height=7) #png

#kegg copy number
healthy_old_kegg_copy_number=plotFunctions(health_old, fun_level = 'KEGG',count = 'copy_number',base_size = 6)
healthy_old_kegg_copy_number
ggsave(file='~/my_shared_data_folder/crcshotgun/plots/healthy_old_kegg_copy_number.png', plot = healthy_old_kegg_copy_number, width=9, height=7) #png

#species with raw abundance
healthy_old_species_abund= plotTaxonomy(health_old, rank='species', count='abund',base_size = 6,ignore_unmapped = T,
                                       ignore_unclassified = T)
healthy_old_species_abund
ggsave(file='~/my_shared_data_folder/crcshotgun/plots/healthy_old_species_abund.png', plot = healthy_old_species_abund, width=9, height=7) #png


#species with raw perce,tage
healthy_old_species_percent= plotTaxonomy(health_old, rank='species', count='percent',base_size = 6,ignore_unmapped = T,
                                        ignore_unclassified = T)
healthy_old_species_percent
ggsave(file='~/my_shared_data_folder/crcshotgun/plots/healthy_old_species_percent.png', plot = healthy_old_species_percent, width=9, height=7) #png

# genus for Bacteroidetes
bacteroidetes=subsetTax(health_old, 'phylum',tax='Bacteroidetes', rescale_copy_number = F)
bacteroidetes_genus=plotTaxonomy(bacteroidetes, 'genus','percent', N=10, rescale = T, others = T,base_size = 6)
ggsave(file='~/my_shared_data_folder/crcshotgun/plots/bacteroidetes_genus.png', plot = bacteroidetes_genus, width=9, height=7) #png

# species for Bacteroidetes
bacteroidetes_species=plotTaxonomy(bacteroidetes, 'species','percent', N=10, rescale = T, others = T,base_size = 6)
bacteroidetes_species
ggsave(file='~/my_shared_data_folder/crcshotgun/plots/bacteroidetes_species.png', plot = bacteroidetes_species, width=9, height=7) #png

# genus for Firmicutes
Firmicutes=subsetTax(health_old, 'phylum',tax='Firmicutes', rescale_copy_number = F)
Firmicutes_genus=plotTaxonomy(Firmicutes, 'genus','percent', N=10, rescale = T, others = T,base_size = 6)
ggsave(file='~/my_shared_data_folder/crcshotgun/plots/Firmicutes_genus.png', plot = Firmicutes_genus, width=9, height=7) #png

# species for Firmicutes
Firmicutes_species=plotTaxonomy(Firmicutes, 'species','percent', N=10, rescale = T, others = T,base_size = 6)
Firmicutes_species
ggsave(file='~/my_shared_data_folder/crcshotgun/plots/Firmicutes_species.png', plot = Firmicutes_species, width=9, height=7) #png


#creating table

table=health_old$taxa$phylum$abund
 
bacteroidetes_table1=table[c('Bacteroidetes','Firmicutes','Proteobacteria','Uroviricota','Actinobacteria','Chordata','Streptophyta','Verrucomicrobia','Synergistetes','Apicomplexa'),]#we select the bacteras that were more abundant
bacteroidetes_table1
table_data=data.frame(bacteroidetes_table1)
table_data
phylum_healthy_old=rowMeans(table_data)#we calculate the mean of the samples we have
phylum_healthy_old=data.frame(phylum_healthy_old)
View(phylum_healthy_old)#this table contains the average of all the samples of healthy old for the bacteras selected
exportTable(phylum_healthy_old, '~/my_shared_data_folder/crcshotgun/plots/phylum_healthy_old_mean_table.txt')


#creating mean table for family
table2=health_old$taxa$family$abund
View(table2)
bacteroidetes_table2=table2[c('Bacteroidaceae','Oscillospiraceae','Prevotellaceae','Lachnospiraceae','Selenomonadaceae','Veillonellaceae','Eubacteriaceae','Rikenellaceae','Tannerellaceae','Clostridiaceae'),]#we select the bacteras that were more abundant
bacteroidetes_table2
table_data2=data.frame(bacteroidetes_table2)
family_healthy_old=rowMeans(table_data2)#we calculate the mean of the samples we have
family_healthy_old=data.frame(family_healthy_old)
View(family_healthy_old)#this table contains the average of all the samples of healthy old for the bacteras selected
exportTable(family_healthy_old, '~/my_shared_data_folder/crcshotgun/plots/family_healthy_old_mean_table.txt')

