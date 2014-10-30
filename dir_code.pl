#!/usr/bin/perl
use File::Copy;
use strict; use warnings;
#C:/Users/apawar/Documents/lab/lijuin/TCGA/cnv/tumor_match/CNV_SNP_Array/BI__Genome_Wide_SNP_6/Level_3/BEAUX_p_TCGA_b109_SNP_2N_GenomeWideSNP_6_A01_772082.hg18.seg.txt
#C:/Users/apawar/Documents/lab/lijuin/TCGA/cnv/tumor_match/CNV_SNP_Array/BI__Genome_Wide_SNP_6/Level_3/
opendir(DIR, 'C:/Users/apawar/Documents/lab/lijuin/TCGA/cnv/tumor_match/CNV_SNP_Array/BI__Genome_Wide_SNP_6/Level_3') or die "Couldn't open directory, $!";

# #creating new directory
	my $dir = "C:/Users/apawar/Documents/lab/lijuin/TCGA/cnv/tumor_match/CNV_SNP_Array/BI__Genome_Wide_SNP_6/Level_3/nocnv_full_name";
# # # This creates perl directory in /tmp directory.
	mkdir( $dir ) or die "Couldn't create $dir directory, $!";
	print "Directory created successfully/n";

#reading from DIR

my $count=0;
while (my $file = readdir DIR) {

  if ($file=~ m/nocnv_hg19/i)
  {
	if ($file=~ m/GenomeWideSNP_6_/i)
	{
		print $'."/n";
		my $file1="C:/Users/apawar/Documents/lab/lijuin/TCGA/cnv/tumor_match/CNV_SNP_Array/BI__Genome_Wide_SNP_6/Level_3/$file";
		my $try="C:/Users/apawar/Documents/lab/lijuin/TCGA/cnv/tumor_match/CNV_SNP_Array/BI__Genome_Wide_SNP_6/Level_3/nocnv_full_name/$file";
		#print "$try/n";
		copy($file1,$try) or die "Failed to copy $file: $!/n";
		$count++;
	}
  }
}
print"DoNE"."/n";
print $count;
closedir DIR;

