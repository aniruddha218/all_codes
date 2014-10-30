#!/usr/bin/env python
import os, shutil

with open("C:\\Users\\apawar\\Documents\\lab\\lijuin\\Drug_Data_All\\CCLE\\ccle_r\\cns_ref_exp_arrays.txt","r") as outfile:
	collect=dict()
	for vastu in outfile:
		vast=vastu.rstrip('\r\n')
		sep=list()
		sep=vast.split('\t')
		#print sep[0]
		#collect=list.append(sep[0])
		collect[vast]=1
outfile.close()

src=("C:\\Users\\apawar\\Documents\\lab\\lijuin\\Drug_Data_All\\CCLE\\CCLE_Expression.Arrays_2013-03-18.tar\\CCLE_Expression.Arrays_2013-03-18\\CCLE_Expression.Arrays_2013-03-18\\")
dst=("C:\\Users\\apawar\\Documents\\lab\\lijuin\\Drug_Data_All\\CCLE\\ccle_r\\cns_exp")
for filename in os.listdir(src):
	#print filename
	if filename in collect:
		fii=os.path.join(src, filename)
		shutil.copy(fii,dst)
		print filename
		#print "done!"
	
print"zala!!:-)"
