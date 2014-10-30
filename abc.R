library(gdata)
my.data<-read.xls("C:/Users/apawar/Documents/lab/lijuin/Drug_Data_All/CCLE/ccle_r/Wrkng_mut_correct_breast_1651_CCLE_hybrid_capture1650_hg19_NoCommonSNPs_NoNeutralVariants.xlsx")
my.count<-data.frame(table(my.data$Tumor_Sample_Barcode))
write.table(my.count,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/mutation/freq_ccle_breast.txt", quote=F, sep="\t", col.names=F, row.names=F )

my.tcag.br<-read.xls("C:/Users/apawar/Documents/lab/lijuin/TCGA/mut/tumor_matched/Somatic_Mutations/WUSM__IlluminaGA_DNASeq_curated/Level_2/wkng_TCGA_brca.xlsx")

