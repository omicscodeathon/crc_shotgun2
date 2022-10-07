#Loading necessary packages
library('SQMtools')
library('ggplot2')
#Creating SQM object
healthy_young <- loadSQM("~/my_shared_data_folder/crcshotgun/squeezemeta_out/healthy_young")
View(healthy_young)
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
