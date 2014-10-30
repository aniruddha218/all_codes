#!/usr/bin/perl
#use warnings; 
#use warnings; 
use strict;

open IN1, "<C:/Users/apawar/Documents/lab/lijuin/Extra/cellline_drugs/time_pass_nci.txt" or die "Cannot open gene list:$!";
open OUT1, ">C:/Users/apawar/Documents/lab/lijuin/Extra/cellline_drugs/time_pass_nci_results.txt" or die "Cannot write data file:$!";
open OUT2, ">C:/Users/apawar/Documents/lab/lijuin/Extra/cellline_drugs/time_pass_nci_results_2.txt" or die "Cannot write data file:$!";


my $line;
my %big;
#my @value;
#my $don;
while(my $er=<IN1>){
	chomp $er;
	my @tap=split(/\t/,$er);
	my $chavi= shift (@tap);
	push(@{$big{$chavi}},@tap);
	}

	
 # for(keys%big){
	## @value;
	# @value= (@{$big{$_}}) ;
	# for $don (@values)
	# {print "$_\t$value[$don])\n" ;}
	# }
	
	for my $tmp (keys %big){
	my @ara= @{$big{$tmp}};
	my @unique = do { my %seen; grep { !$seen{$_}++ } @ara};
	print "$tmp\t@unique\n";
	print  join("\n",@unique)."\n";
	
	print OUT1 "$tmp\n";
	print  OUT1 join("\n\t",@unique)."\n";
	print  OUT1 "*********\n";
	foreach my $tempo (@unique)
	{
		print OUT2"$tmp\t@unique[$tempo]\n";
	}
	}
	