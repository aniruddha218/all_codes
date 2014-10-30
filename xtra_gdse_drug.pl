#!/usr/bin/perl
use warnings; use strict;

open IN1, "<C:/Users/apawar/Documents/lab/lijuin/Extra/cellline_drugs/cell_line_list.txt" or die "Cannot open gene list:$!";
open IN2, "<C:/Users/apawar/Documents/lab/lijuin/Drug_Data_All/GDSE/2014_latest_release/for_drug.txt" or die "Cannot open data file:$!";
open OUT1, ">C:/Users/apawar/Documents/lab/lijuin/Extra/cellline_drugs/cell_line_list_drugs_gdsc.txt" or die "Cannot write data file:$!";

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
	my @table=split(/\t/,$reg);
	#print $table[0]."\n"; 
	#my @new= split(/_/,$table[0]);
	#print $new[0]."\n";
	foreach $egg(@ccle)
	{
		 my $string1=$egg;
		 my $string2=$table[0];
		#if ($egg =~ m/$new[0]/)
		if (uc($string1) eq uc($string2))
		{
			# print $new[0];
			# print "\n";
			# print $egg;
			print OUT1 join("\t",$string1,$reg)."\n";
			#print OUT1 "$reg\n";
		}
	}
}
