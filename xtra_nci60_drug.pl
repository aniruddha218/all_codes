#!/usr/bin/perl
use warnings; use strict;

open IN1, "<C:/Users/apawar/Documents/lab/lijuin/Extra/cellline_drugs/CANCER60GI50_cellline_names_uniq_use_for_given.txt" or die "Cannot open gene list:$!";
open IN2, "<C:/Users/apawar/Documents/lab/lijuin/Drug_Data_All/NCI60/LC50/CANCER60LC50.LST" or die "Cannot open data file:$!";
open OUT1, ">C:/Users/apawar/Documents/lab/lijuin/Extra/cellline_drugs/CANCER60LC50_matched_cellline.txt" or die "Cannot write data file:$!";



#for finding all cell namrs. use R to get uniq!
# #my $fh= shift;
# my $moz=0;
# my @in_all;
# while(<IN2>)
# {
	# chomp $_;
	# my @in_line=split(/,/,$_);
	# push(@in_all, $in_line[4]);
	
	# #last if ($moz==10);
	
# }
# print OUT1 join("\n", @in_all);
# #print join("\n", @in_all);


my $line;
my @ccle;
while($line=<IN1>)
{
	chomp$line;
	push(@ccle,$line);
	#print $line."\n";
}
#print scalar(@ccle);
#print $ccle[0]; 
#print (join(@ccle, "\t"));


my $reg;
my $egg;
my $count=0;
while ($reg=<IN2>)
{
	chomp $reg;
	print OUT1 "\t".$reg."\n" if ($count==0);
	$count++;
	my @table=split(/,/,$reg);
	#print $table[0]."\n"; 
	#my @new= split(/_/,$table[0]);
	#print $new[0]."\n";
	foreach $egg(@ccle)
	{
		 my $string1=$egg;
		 my $string2=$table[4];
		#if ($egg =~ m/$new[0]/)
		if (uc($string1) eq uc($string2))
		{
			# print $new[0];
			# print "\n";
			# print $egg;
			print OUT1 join("\t",$string1,join("\t",@table))."\n";
			#print OUT1 "$reg\n";
		}
	}
}

