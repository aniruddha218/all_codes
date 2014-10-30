#!/usr/bin/env python

matrix=dict()
with open("C:\\Users\\apawar\\Documents\\lab\\lijuin\\Extra\\drug_search\\inter_ulta_gdsc_search.txt","w") as outfile:
	with open ("C:\\Users\\apawar\\Documents\\lab\\lijuin\\Extra\\drug_search\\ulta_gdsc.txt","r") as onfile:
		with open ("C:\\Users\\apawar\\Documents\\lab\\lijuin\\Extra\\drug_search\\Drug_response.txt","r") as infile:
			for lin in infile:
				line=lin.rstrip('\r\n')
				sep=list()
				sep=line.split('\t')
				if len(sep[1].strip())!=0:
					if sep[1].strip() in matrix:
						pass
					else:
						matrix[sep[1].strip()]=sep[0]
			# for x in matrix:
				# print (x)
			i=0
			for tin in onfile:
				tine=tin.rstrip('\r\t')
				pes=list()
				pes=tine.split('\t')
				chotu=pes[1].lower()
				if len(chotu.strip()) !=0:
					if (chotu.strip()) in matrix:
						#print tine
						outfile.write("{0}".format(tine))
						i+=1
			print i
