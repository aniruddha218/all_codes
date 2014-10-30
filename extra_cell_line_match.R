cell.no.ano<-read.csv("C:/Users/apawar/Documents/lab/lijuin/Extra/Cell_line_annot/all_cell_line.txt", header=T)
cell.ano.ccle<-read.csv("C:/Users/apawar/Documents/lab/lijuin/Drug_Data_All/CCLE/Cell_Line_Annotations.csv", header=T)

#split string of ccle cell line annot so that it can be used to map with given new cell line

cell.tmpr=NULL
for (i in (1:nrow(cell.ano.ccle)))
{
  label.name<-unlist(strsplit(as.character(cell.ano.ccle$label)[i],"[_]"))[1]
  cell.tmpr=rbind(cell.tmpr,as.character(label.name))
  
}
colnames(cell.tmpr)<-c("label.m")

#adding new col to ccle cell line annot
cell.ano.ccle.mod<-cbind(cell.tmpr,cell.ano.ccle)

# merging the two cell line df
t1<-merge(cell.no.ano,cell.ano.ccle.mod, by.x = ("Cell.line.name"),by.y="label.m", all.x=T)
write.table(t1,"C:/Users/apawar/Documents/lab/lijuin/Extra/Cell_line_annot/all_cell_line_matched_ccle.txt",quote=F, sep="\t", col.names = T, row.names=F)