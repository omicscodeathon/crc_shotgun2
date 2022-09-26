library('SQMtools')
healthy_young <- loadSQM('~/my_shared_data_folder/crcshotgun/squeezemeta_out/healthy_young')
#plotting taxonomy based on family
plotTaxonomy(healthy_young,rank = "family",count = "percent",base_size = 6,ignore_unclassified = TRUE, ignore_unmapped = TRUE)
ggsave(file'taxfamilyhealthyoung.png',plot=tax_family_health_young, width=9, height= 7)

plotTaxonomy(healthy_young,rank = "phylum",count = "percent",base_size = 6,ignore_unclassified = TRUE, ignore_unmapped = TRUE)

plotTaxonomy(healthy_young,rank = "phylum",count = "abund",base_size = 6,ignore_unclassified = TRUE, ignore_unmapped = TRUE)

#plotting kegg
plotFunctions(healthy_young, fun_level = 'KEGG', count = 'tpm', N = 15,base_size = 6)
