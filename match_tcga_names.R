tc.br.irdf<-read.table("C:/Users/apawar/Documents/lab/lijuin/TCGA/cnv/cnv_all/METADATA/BI__Genome_Wide_SNP_6/broad.mit.edu_BRCA.Genome_Wide_SNP_6.sdrf.txt", sep="\t", header=T)
small.data<-tc.br.irdf[,c("Comment..TCGA.Barcode.", "Derived.Array.Data.File.3")]

#small.data[ ,"use.name"]<-small.data[ ,(unlist(strsplit(as.character(small.data$Derived.Array.Data.File.3)[1],"[.]"))[1])]
  
small.data.all=NULL  
for (i in (1:nrow(small.data)))
  {
    use.name<-unlist(strsplit(as.character(small.data$Derived.Array.Data.File.3)[i],"[.]"))[1]
    one.row<-cbind(as.character(small.data[i,1]),use.name)
    small.data.all<-rbind(small.data.all,one.row)
  }
colnames(small.data.all)<-c("Comment..TCGA.Barcode.","usename")
write.table(small.data.all,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/tcga_match_ID.txt", quote=F, sep="\t", col.names = T, row.names=F)
