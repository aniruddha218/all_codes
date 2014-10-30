
#zz<-read.table("C:/Users/apawar/Documents/1lab/lijuin/Cancer_browser_data/CB_brca_cp_nogerm/TCGA_BRCA_GSNP6noCNV-2014-05-02/genomicSegment", header=F, sep="/t")

my_data<-read.table("C:\\Users\\apawar\\Documents\\lab\\lijuin\\TCGA\\cnv\\tumor_match\\CNV_SNP_Array\\BI__Genome_Wide_SNP_6\\TCGA_copynumber_for_cntools.seg", header=T, sep="\t")
require("CNTools")
data(sampleData)
head(sampleData)

cnseg <- CNSeg(my_data[which(is.element(my_data[, "ID"], sample(unique(my_data[, "ID"]),))), ])
rdseg <- getRS(cnseg, by = "region", imput = FALSE, XY = TRUE, what = "mean")
data("geneInfo")
#geneInfo <- geneInfo[sample(1:nrow(geneInfo), 2000), ]
rdByGene <- getRS(cnseg, by = "gene", imput = FALSE, XY = TRUE, geneMap = geneInfo, what = "median")

reducedseg <- rs(rdByGene)
#write.table(reducedseg,"C:/Users/apawar/Documents/lab/lijuin/TCGA/cnv/tumor_match/CNV_SNP_Array/BI__Genome_Wide_SNP_6/Level_3/nocnv_full_name/genes_cn.txt", sep="\t")
write.table(reducedseg,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/tcga_brca_gene_by_gene.txt", sep="\t")



my_ccle<-read.table("C:/Users/apawar/Documents/lab/lijuin/Drug_Data_All/CCLE/CCLE_copynumber_2012-09-29__for_cntools.seg", sep="\t", header=T)
require("CNTools")
data(sampleData)
head(sampleData)

cnseg_ccle <- CNSeg(my_ccle[which(is.element(my_ccle[, "ID"], sample(unique(my_ccle[, "ID"]),))), ])
rdseg_ccle <- getRS(cnseg_ccle, by = "region", imput = FALSE, XY = T, what = "mean")
data("geneInfo")
#geneInfo <- geneInfo[sample(1:nrow(geneInfo), 2000), ]
rdByGene_ccle <- getRS(cnseg_ccle, by = "gene", imput = FALSE, XY = T, geneMap = geneInfo, what = "median")

reducedseg_ccle <- rs(rdByGene_ccle)
write.table(reducedseg_ccle,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/ccle_gene_by_gene.txt", sep="\t")
