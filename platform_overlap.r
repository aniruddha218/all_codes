hgu133.2<-read.csv("C:\\Users\\apawar\\Documents\\lab\\lijuin\\Extra\\Platforms\\GPL570_HGU133_Plus_2.txt",skip=16, header=T,sep="\t")
hgu133a.2<-read.csv("C:\\Users\\apawar\\Documents\\lab\\lijuin\\Extra\\Platforms\\GPL571_HG-U133A_2.txt",skip=16, header=T,sep="\t")
common<-intersect(hgu133.2[,1],hgu133a.2[,1])
