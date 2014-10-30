#!/usr/bIN/perl
use warnings; use strict;

my $dir_path="C:/Users/apawar/Documents/lab/lijuin/TCGA/mut/coverage/beds";
open (OUT1, ">C:/Users/apawar/Documents/lab/lijuin/data_for_paper/mutation/tcga_mut/tcga_coverage111.txt") or die "Cant open OUT1 file:$!";

print OUT1 "HI\n";

##imp syntax
my @files=glob "$dir_path/*";

my @name_box;
foreach my $file_name(@files)
{
		push (@name_box,$file_name);
		open my $data, '<',"$file_name" or die "Cannot open file $file_name: $!";
		#my $cnt=0;
		my @cah;
		my $tot=0;
		my $final=0;
		#my $cont=0;
		while(<$data>)
		{
			my $line=$_;
			@cah=split(/\t/,$line);
			
			$tot=($cah[2])-($cah[1]);
			#print $_;
			#print "\n$tot\n";
			$final+=$tot;
		}
		print OUT1 "$file_name\t$final\n";
		print "$file_name\t$final\n";
		print "new file !!!\n";
	

}
print scalar(@name_box);
close OUT1;