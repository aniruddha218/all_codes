#!/usr/bin/env python

p5=dict()
with open("C:/Users/apawar/Documents/lab/lijuin/Extra/lets_model/pam50/pam50.txt",'r') as pam50:
	for line in pam50:
		line.rstrip('\r\n')
		sep=list()
		sep=line.split('\t')
		if len(sep[0].strip())!=0:
			if sep[0].strip() in p5:
				pass
			else:
				p5[sep[0].strip()]=1

with open ("C:/Users/apawar/Documents/lab/lijuin/Extra/lets_model/tissue/41988/gene_exp/41998_noprobe_gene_ids_only_uniq_genes_headeradded_namescorrected_p50.txt",'w') as outfile:
	with open ("C:/Users/apawar/Documents/lab/lijuin/Extra/lets_model/tissue/41988/gene_exp/41998_noprobe_gene_ids_only_uniq_genes_headeradded_namescorrected.txt",'r') as mainfile:
		for mine in mainfile:
			mine.rstrip('\r\n')
			dep=list()
			dep=mine.split('\t')
			if len(dep[0].strip()) !=0:
				if (dep[0].strip()) in p5:
					outfile.write("{0}".format(mine))
					print mine
				else:
					pass
		
