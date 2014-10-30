my.res<-read.csv("C:\\Users\\apawar\\Documents\\lab\\lijuin\\Drug_Data_All\\CCLE\\CCLE_Expression_2012-09-29_modified.res",sep="\t", header=F)

#for Breast
{ideal.br=NULL

  for (g in (1:length(my.res[1,])))
  {
    one_b<-as.character(my.res[1,g])
    ideal.br=cbind(ideal.br,one_b)
  }
}
my.head.br<-grep("breast",ideal.br,value=T,ignore.case =T)
my.head.br<-append(c("Description","Accession"),my.head.br)

my.head.br.id<-grep("breast",ideal.br,value=F,ignore.case =T)
br.cc.gnex=subset(my.res, select=c(2,3,my.head.br.id))

write.table(br.cc.gnex,"C:/Users/apawar/Documents/lab/lijuin/Drug_Data_All/CCLE/CCLE_Exp_breast_54K.txt", sep="\t",quote=F,col.names=F, row.names=F)



#forCNS

{ideal.cns=NULL
 
 for (c in (1:length(my.res[1,])))
 {
   one_c<-as.character(my.res[1,c])
   ideal.cns=cbind(ideal.cns,one_c)
 }
}
my.head.cns<-grep("NERVOUS",ideal.cns,value=T,ignore.case =T)
my.head.cns<-append(c("Description","Accession"),my.head.cns)

my.head.cns.id<-grep("NERVOUS",ideal.cns,value=F,ignore.case =T)
cns.cc.gnex=subset(my.res, select=c(2,3,my.head.cns.id))

write.table(cns.cc.gnex,"C:/Users/apawar/Documents/lab/lijuin/Drug_Data_All/CCLE/CCLE_Exp_CNS_54K.txt", sep="\t",quote=F,col.names=F, row.names=F)

