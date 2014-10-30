my_tcga<-read.table("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/TCGA_copynumber_for_cntools.seg", sep="\t", header=T)
head(my_tcga)
  #buliding script
samples<-unique(my_tcga[,"ID"])
length(samples)
#dont.knw<-my_tcga[which(is.element(my_tcga[, "ID"],(unique(my_tcga[, "ID"])))), ]
#samples[1:10]

final.matrix=NULL
final.matrix1=NULL
final.matrix2=NULL

for (i in  (1:length(samples)))
{ name.id=NULL
  name.id.block=NULL
  total=NULL
  daat=NULL
  ans=NULL
  select.l=NULL
  
  name.id<-samples[i]
  name.id.block<-my_tcga[which(as.character(my_tcga$ID)==as.character(name.id)),]
  name.id.block[,"start-end"]<-(name.id.block[,4]-name.id.block[,3])
  
  total=sum(as.numeric(name.id.block[,"start-end"]))
  #daat=subset(name.id.block,name.id.block$seg.mean>0.2)# for positive valus greater than 0.2
  daat=subset(name.id.block,abs(name.id.block$seg.mean)>0.3) ## for all values greater than mod 0.2
  select.l=sum(as.numeric(daat[,"start-end"]))
  ans=select.l/total
  #print (name.id)
  #print (ans)
  
  final.matrix1<-rbind(final.matrix1,as.character(name.id))
  final.matrix2<-rbind(final.matrix2,as.numeric(ans))
  
  
}
final.matrix=cbind(final.matrix1,final.matrix2)
colnames(final.matrix)<-c("Name","FGA")
#final.matrix

#write.table(final.matrix,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/TCGA_copynumber_FGA_point2_mod.txt", quote=F, sep="\t", col.names=T, row.names=F )


#############creating plots
#CAUTION  you need to store all values of t in attempt variable

#plot(density(as.numeric(attempt.1[,2])))
plot(density(as.numeric(pttempt.05[,2])),xlab="FGA",ylim=c(0,4),main="Tumors @ different Thresholds")
lines(density(as.numeric(pttempt.1[,2])),col=2)
lines(density(as.numeric(pttempt.15[,2])),col=3)
lines(density(as.numeric(pttempt.2[,2])),col=4)
lines(density(as.numeric(pttempt.3[,2])),col=5)
legend(0.94,4.1,c("T=0.05","T=0.1","T=0.15","T=0.2","T=0.3"),col=1:5,lty=c(1,1,1,1,1))

hist(abs(as.numeric(my_tcga[,2])),ncalss=100)

hist((my_tcga[,6]),nclass=50,main="Histogram of TCGA",xlab="CN values (log2)")
abline(v=0.1,col=4)
