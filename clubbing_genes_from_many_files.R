filenames<-list.files( "C:/Users/apawar/Documents/lab/lijuin/TCGA/cnv/tumor_match/exp/Expression-Genes/UNC__AgilentG4502A_07_3/Level_3", pattern="*.txt", full.names=T )
ldf<-lapply(filenames,read.csv,header=F,sep="\t")


j.df<-NULL
names.genes<-as.character(ldf[[1]][-2,1])
j.df<-cbind(j.df,names.genes)
for (i in (1:530))
{
  cvs=NULL
  cvs<-data.frame(unlist(ldf[[i]][-2,2]))
  j.df<-cbind(j.df,cvs)
  
}
head(j.df)
write.table(j.df,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/gene_exp/TCGA_gene_exp.txt", sep="\t",quote=F,col.names=F, row.names=F)

#rough work

bb<-ldf[[1]]
bb1<-ldf[[1]][-1,2]
dim(bb)
head(bb1)

