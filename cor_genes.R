ccle_cnv<-read.table("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/cnv_genebygene/CCLE_copynumber_brca_genebygene.txt",header=T,sep="\t")
tcga_cnv<-read.table("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/cnv_genebygene/TCGA_copynumber_genebygene_namestrail.txt",header=T,sep="\t")

ccle_data<-ccle_cnv[,-(1:5)]
tcga_data<-tcga_cnv[,-(1:5)]
cor.all<-cor(ccle_data,tcga_data)

library("psych")
cor.all.test<-corr.test(ccle_data,tcga_data,method="pearson",adjust="none")
cor.frm.psh<-cor.all.test$r
pval.frm.psh<-cor.all.test$p

carmel=NULL
for (i in (1:59))
{
  new.carmel<-max(cor.frm.psh[i,])
  back.carmel<-which.max(cor.frm.psh[i,])
  p.carmel<- pval.frm.psh[i,back.carmel]
  carmel=rbind(carmel,c(new.carmel,p.carmel))
}
 colnames(carmel)<-c("max value","p-value")
rownames(carmel)<-rownames(cor.frm.psh)
write.table(carmel,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/cnv_genebygene/cor_results/max_cnv_cor_value.txt", sep="\t",quote=F,col.names=T, row.names=T)


dayton=NULL
for (i in (1:59))
{
  new.dayton<-median(cor.frm.psh[i,])
  #back.dayton<-which.max(cor.frm.psh[i,])
  #p.dayton<- pval.frm.psh[i,back.dayton]
  dayton=rbind(dayton,c(new.dayton))
}
colnames(dayton)<-c("median value")
rownames(dayton)<-rownames(cor.frm.psh)
write.table(dayton,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/cnv_genebygene/cor_results/median_cnv_cor_value.txt", sep="\t",quote=F,col.names=T, row.names=T)


mean.tcga_data<-as.matrix(apply(tcga_data,1,mean))
colnames(mean.tcga_data)<-c("mean-tcga")

cor.new<-corr.test(ccle_data,mean.tcga_data,method="pearson",adjust="none")
cor.frm.psh.new<-cor.new$r
pval.frm.psh.new<-cor.new$p
write.table(cor.frm.psh.new,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/cnv_genebygene/cor_results/mean_cnv_cor_value.txt", sep="\t",quote=F,col.names=T, row.names=T)

write.table(pval.frm.psh.new,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/cnv_genebygene/cor_results/mean_cnv_pvalue_value.txt", sep="\t",quote=F,col.names=T, row.names=T)

