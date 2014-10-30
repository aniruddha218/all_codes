my.tcga.brca<- read.csv("C:/Users/apawar/Documents/lab/lijuin/TCGA/mut/tumor_matched/Somatic_Mutations/WUSM__IlluminaGA_DNASeq_curated/Level_2/wkng_TCGA_brca.txt", sep="\t", header=T)
tcga.brca.mut<-data.frame(table(my.tcga.brca$Tumor_Sample_Barcode))
write.table(tcga.brca.mut,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/mutation/tcga_mut/freq_tcga_breast.txt", sep="\t",quote=F,col.names=F, row.names=F)

tcga.cov<-read.table("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/mutation/tcga_mut/tcga_coverage_cur.txt", header=F, sep="\t")

a1<-merge(tcga.cov, tcga.brca.mut,by.x="V1",by.y="Var1")
write.table(a1,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/mutation/tcga_mut/tcga_breast_intersect.txt", sep="\t",quote=F,col.names=F, row.names=F)
a1["mMB"]<-(a1[,3]/a1[,2])*1000000
write.table(a1,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/mutation/tcga_mut/tcga_breast_intersect_ans.txt", sep="\t",quote=F,col.names=F, row.names=F)


ccle.mut<-read.table("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/mutation/ccle_mut/freq_ccle_breast.txt", header=F, sep="\t")

ccle.cov<-read.table("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/mutation/ccle_mut/whole_cell_coverage.txt", header=F, sep="\t")
a2<-merge(ccle.mut, ccle.cov,by.x="V1",by.y="V1")
write.table(a2,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/mutation/ccle_mut/ccle_breast_intersect.txt", sep="\t",quote=F,col.names=F, row.names=F)
a2["mMB"]<-(a2[,2]/a2[,3])*1000000
write.table(a2,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/mutation/ccle_mut/ccle_breast_intersect_ans.txt", sep="\t",quote=F,col.names=F, row.names=F)



####plots

mut.ccle<-read.table("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/mutation/ccle_mut/ccle_breast_intersect_ans.txt", sep="\t",header=F)
mut.tcga<-read.table ("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/mutation/tcga_mut/tcga_breast_intersect_ans.txt", sep="\t",header=F)

plot(density(as.numeric(mut.tcga[,4])),xlim=c(0,18),xlab="Mutations per million bases", main="Mutations",col=4)
lines(density(as.numeric(mut.ccle[,4])),col=2)
legend(13,0.6,c("Tumor","Cellline"),col=c(4,2),lty=c(1,1))
