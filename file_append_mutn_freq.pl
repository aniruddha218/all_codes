#!/usr/bIN/perl
use warnings; use strict;

my $dir_path="C:/Users/apawar/Documents/lab/lijuin/Drug_Data_All/CCLE/CCLE_hybrid_capture1650_hg19_coverage_2012.06.19.tar/all_files";
open (OUT, ">C:/Users/apawar/Documents/lab/lijuin/Drug_Data_All/CCLE/trail_mutn_count.txt") or die "Cant open OUT file:$!";

##imp syntax
my @files=glob "$dir_path/*";

my @name_box;
foreach my $file_name(@files){
	if ($file_name=~ "BREAST" )
	{
		#print $file_name."\n";
		#print "\n\n";
		push (@name_box,$file_name);
		open my $data, '<',"$file_name" or die "Cannot open file $file_name: $!";
		my $cnt=0;
		#my $cont=0;
		while(<$data>)
		{
			if ($_=~ /^[0-9]/ )
			{
			$cnt++ if ($_ >0);
			#print "ho";
			}
			
		}
		print OUT "$file_name\t$cnt\n";
		print "$file_name\t$cnt\n";
	}

}
print scalar(@name_box);