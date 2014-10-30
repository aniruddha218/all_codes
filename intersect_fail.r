library(gdata)
my.search<-read.xls("C:/Users/apawar/Documents/lab/lijuin/Extra/drug_search/Need_Drug_Response_ForAnni.xlsx")
my.ccle<-read.xls("C:/Users/apawar/Documents/lab/lijuin/Extra/drug_search/ccle.xlsx")
#my.gdsc<-read.xls("C:/Users/apawar/Documents/lab/lijuin/Extra/drug_search/gdsc.xlsx")
my.gdsc<-read.csv("C:/Users/apawar/Documents/lab/lijuin/Extra/drug_search/gdsc.txt",sep="\t", header =T)
my.gdsc.sulta<-read.csv("C:/Users/apawar/Documents/lab/lijuin/Extra/drug_search/inter_ulta_gdsc_search.txt",sep="\t", header =F)

#my.pccssm_avg<-read.xls("C:/Users/apawar/Documents/lab/lijuin/Extra/drug_search/pccssm_avg_pct_viability_data.xlsx")
#my.pccssm_auc<-read.xls("C:/Users/apawar/Documents/lab/lijuin/Extra/drug_search/pccssm_area_under_conc_curve.xlsx")
pccssm_avg<-read.table("C:/Users/apawar/Documents/lab/lijuin/Extra/drug_search/pccssm_avg_pct_viability_data.txt", sep="\t", header =T)
pccssm_auc<-read.table("C:/Users/apawar/Documents/lab/lijuin/Extra/drug_search/pccssm_area_under_conc_curve.txt", sep="\t", header =T)


ccle.drg.nam<-unique(tolower(my.ccle$Compound))
search.drg.nam<-unique(my.search$Unique_Hit_Cancer_LINCS_drug_name)
c_s=intersect(ccle.drg.nam,search.drg.nam)

pccssm.auc.drg.nam<-unique(tolower(pccssm_auc$compound_name))
p_s=intersect(pccssm.auc.drg.nam,search.drg.nam)

gdsc.drg.nam<-unique(tolower(my.gdsc[1,]))
g_s=intersect(gdsc.drg.nam,search.drg.nam)

ulta.gdsc<-t(my.gdsc)
write.table(ulta.gdsc,"C:/Users/apawar/Documents/lab/lijuin/Extra/drug_search/ulta_gdsc.txt", sep="\t",quote=F,col.names=F, row.names=F)

sulat.gdsc<-t(my.gdsc.sulta)
write.table(sulat.gdsc,"C:/Users/apawar/Documents/lab/lijuin/Extra/drug_search/sulta_gdsc.txt", sep="\t",quote=F,col.names=F, row.names=F)

tp<-(my.search$Unique_Hit_Cancer_LINCS_drug_name)
asm<-my.ccle[with (my.ccle, match(my.ccle$Compound,my.search[,2],nomatch = FALSE)), ]

pl<-my.search
for i in (1:115)
{
  drg.name=my.search[i,2]
  kahi=my.ccle[which]
  print 
  
}