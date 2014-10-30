ensembl.gl<-read.table("C:/Users/apawar/Documents/lab/lijuin/db/ensembl/gene_ensembl_id.txt", sep="\t", header =T)
ccle.gl<-read.table("C:/Users/apawar/Documents/lab/lijuin/db/ensembl/ccle_gene_exp.txt", sep="\t", header =T)
a<-intersect(ccle.gl[,1],ensembl.gl[,3])
b<-setdiff(ccle.gl[,1],ensembl.gl[,3])
ccle.gl.untouched<-read.table("C:/Users/apawar/Documents/lab/lijuin/db/ensembl/ccle_genename_untouched.txt", sep="\t", header =T)

nuksan<-intersect(ccle.gl[,1],ccle.gl.untouched[,1])
changed_excel<-setdiff(ccle.gl[,1],ccle.gl.untouched[,1])
change<-setdiff(ccle.gl.untouched[,1],ccle.gl[,1])


###checking commonalities between 3 db usinf gene (exp, cp, mut), drugs
# Genes
ccle.gnex.cl<- read.table("C:/Users/apawar/Documents/lab/lijuin/db/ccle/gene_exp/ccle_gene_exp_cell_line_list.txt", sep="\t", header =F)
gdsc.gnex.cl<- read.table("C:/Users/apawar/Documents/lab/lijuin/db/gdsc/gene_mut_cp/gdsc_en_input_w5.csv/gdsc_gene_cp_cell_line_list.txt", sep="\t", header =F)
pccssm.gnex.cl<- read.table("C:/Users/apawar/Documents/lab/lijuin/db/pccssm/ori_data/Broad.CTD2.M2.cell_line_info.txt", sep="\t", header =T)

#intersections
ccle.gdsc.pccssm<-intersect(ccle.gnex.cl[,1],intersect(gdsc.gnex.cl[,1],pccssm.gnex.cl[,1]))
ccle.gdsc<-intersect(ccle.gnex.cl[,1],gdsc.gnex.cl[,1])
ccle.pccssm<-intersect(ccle.gnex.cl[,1],pccssm.gnex.cl[,1])
gdsc.pccssm<-intersect(gdsc.gnex.cl[,1],pccssm.gnex.cl[,1])


#drugs
ccle.drugs<- read.table("C:/Users/apawar/Documents/lab/lijuin/db/ccle/drug/ccle_drug_names.txt", sep="\t", header =F)
# read.table("", sep="\t", header =F)
gdsc.drugs<-read.table("C:/Users/apawar/Documents/lab/lijuin/db/gdsc/drug/gdsc_drug_names.txt", sep="\t", header =F)
pccssm.drugs<-read.table("C:/Users/apawar/Documents/lab/lijuin/db/pccssm/act/pccssm_drug_names.txt", sep="\t", header =F)
drug.bk<-read.csv("C:/Users/apawar/Documents/lab/lijuin/db/drug_bank/Drug_name_dictionary.csv" ,sep=",",header=T)


#intersections
c_d<-intersect( ccle.drugs[,1],drug.bk[,2])
g_d<-intersect( gdsc.drugs[,1],drug.bk[,2])
p_d<-intersect( pccssm.drugs[,1],drug.bk[,2])

c_g<-intersect( ccle.drugs[,1],gdsc.drugs[,1])
c_p<-intersect( ccle.drugs[,1],pccssm.drugs[,1])
g_p<-intersect( gdsc.drugs[,1],pccssm.drugs[,1])


