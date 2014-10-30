fga.c.2<-read.table("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/FGA/CCLE_copynumber_brca_FGA_point2.txt", sep="\t",header=T )
fga.c.3<-read.table("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/FGA/CCLE_copynumber_brca_FGA_point3.txt", sep="\t",header=T )
fga.t.2<-read.table("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/FGA/TCGA_copynumber_FGA_point2.txt", sep="\t", header=T)

fga.c.3.mod<-read.table("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/FGA/CCLE_copynumber_brca_FGA_point3_mod.txt", sep="\t",header=T )
fga.t.2.mod<-read.table("C:/Users/apawar/Documents/lab/lijuin/data_for_paper/FGA/TCGA_copynumber_FGA_point2_mod.txt", sep="\t",header=T )

#plot(density(as.numeric(fga.c.2[,2])))
par(mfrow=c(2,2))
plot(density(as.numeric(fga.c.3[,2])), main="CCLE @ 0.3" )
plot(density(as.numeric(fga.t.2[,2])), main="TCGA @ 0.2")

plot(density(as.numeric(fga.c.3.mod[,2])), main="CCLE @ |0.3|")
plot(density(as.numeric(fga.t.2.mod[,2])),main="TCGA @ |0.2|")
