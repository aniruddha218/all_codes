#!/usr/bIN/perl
use warnings; use strict;

my $dir_path="C:/Users/apawar/Documents/lab/lijuIN/TCGA/cnv/tumor_match/CNV_SNP_Array/BI__Genome_Wide_SNP_6/Level_3/nocnv_full_name";

##imp syntax
my @files=glob "$dir_path/*";


open (OUT, ">C:/Users/apawar/Documents/lab/lijuIN/TCGA/cnv/tumor_match/CNV_SNP_Array/BI__Genome_Wide_SNP_6/Level_3/trail.txt") or die "Cant open OUT file:$!";
#my $ideal;
my $head=1;
foreach  my $file (@files)
	{
	open my $data, '<',"$file" or die "Cannot open file $file: $!";
	my $count=1;
	while (<$data>)
		{
		last if ($head>scalar(@files));
		print OUT $_ if ($count !=1 or $head=1);
		print $_;
		$count++;
		
		}
	$head++;
	}

close OUT;