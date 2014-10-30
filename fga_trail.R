my_ccle<-read.table("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/CCLE_copynumber_brca__for_cntools.seg", sep="\t", header=T)
head(my_ccle)
#buliding script
  samples<-unique(my_ccle[,"ID"])
  length(samples)
  #dont.knw<-my_ccle[which(is.element(my_ccle[, "ID"],(unique(my_ccle[, "ID"])))), ]
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
      name.id.block<-my_ccle[which(as.character(my_ccle$ID)==as.character(name.id)),]
      name.id.block[,"start-end"]<-(name.id.block[,4]-name.id.block[,3])
      
      total=sum(as.numeric(name.id.block[,"start-end"]))
      #daat=subset(name.id.block,name.id.block$seg.mean>0.3) # for positive valus greater than 0.3
      #daat=subset(name.id.block,abs(name.id.block$seg.mean)>0.3)  # for all values greater than mod 0.3
      daat=subset(name.id.block,abs(name.id.block$seg.mean)>0.5)  # for plots
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

#write.table(final.matrix,"C:/Users/apawar/Documents/lab/lijuin/data_for_paper/CCLE_copynumber_brca_FGA_point1_mod.txt", quote=F, sep="\t", 
            #col.names=T, row.names=F )




#############creating plots
#CAUTION  you need to store all values of t in attempt variable

#plot(density(as.numeric(attempt.1[,2])))
plot(density(as.numeric(attempt.1[,2])),xlab="FGA",ylim=c(0,4.5),main="Cell lines @ different Thresholds")
lines(density(as.numeric(attempt.2[,2])),col=2)
lines(density(as.numeric(attempt.3[,2])),col=3)
lines(density(as.numeric(attempt.4[,2])),col=4)
lines(density(as.numeric(attempt.5[,2])),col=5)
legend(1,4.5,c("T=0.1","T=0.2","T=0.3","T=0.4","T=0.5"),col=1:5,lty=c(1,1,1,1,1))

hist((my_ccle[,6]),nclass=50,main="Histogram of CCLE",xlab="CN values (log2)")
abline(v=0.2,col=4)

###
plot(density(as.numeric(attempt.3[,2])),xlab="FGA",ylim=c(0,3),main="",col=2)
lines(density(as.numeric(pttempt.2[,2])),col=4)
legend(0.6,2.9,c("Tumor=0.2","Cellline=0.3"),col=c(4,2),lty=c(1,1))
