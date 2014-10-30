class data_preprocessing():
    """This class is used for creating datasets required to obtain methylated and expressed genes"""
    def __init__(self,filename):
        self.filename=filename
    def duplicate_removal(self):        
        outfile=open('C:/Users/apawar/Documents/lab/lijuin/Extra/lets_model/cell_line/ccle/gene_exp/ccle_noprobes_geneidsonly_uniqgenes.txt','w')#give output file name
        matrix=dict()
        with open(self.filename) as f:
            for line in f:
                line.rstrip('\r\n')
                sep=list()
                sep=line.split('\t')
                if len(sep[0].strip())!=0:
                    if sep[0].strip() in matrix:
                        matrix[sep[0].strip()].append(sep[1:])
                    else:
                            matrix[sep[0].strip()]=[sep[1:]]
        i=0
        j=0        
        for gene in matrix:
            if len(gene)!=0:
                outfile.write('{0}'.format(gene.strip()))
                i=0                
                while i<len(matrix[gene][0]):
                    med=list()
                    j=0
                    while j<len(matrix[gene]):
                        bvalue=matrix[gene][j][i]
                        try:
                            if len(bvalue)!=0 or bvalue.strip()!='NA':
                                med.append(float(bvalue))
                        except:
                            j+=1
                            continue                
                        j+=1
                    i+=1
                    if len(med)!=0:
                        m=self.median(med)
                        outfile.write("\t{0}".format(m))                                        
                outfile.write("\n")                    
    def median(self,median_input):
        self.median_input=median_input
        median=0
        median_length=len(self.median_input)
        median_input=sorted(self.median_input)
        if median_length ==0:
            median=0
        else:
            if median_length %2 ==0:
                if median_length ==1:
                    median=median_input[0]
                else:
                    sel=median_length/2
                    if median_input[sel-1]=="":
                        median_input[sel-1]=0
                        if median_input[sel]=="":
                            median_input[sel]=0
                    
                    fir=float(median_input[sel-1])
                    sec=float(median_input[sel])
                    median=(fir+sec)/2
            else:
                if median_length==1:
                    median=median_input[0]
                else:
                    sel=median_length/2
                    median=median_input[sel]
        return median

if __name__=='__main__':
    a=data_preprocessing('C:/Users/apawar/Documents/lab/lijuin/Extra/lets_model/cell_line/ccle/gene_exp/ccle_noprobes_geneidsonly.txt')#give input filename
    a.duplicate_removal()
