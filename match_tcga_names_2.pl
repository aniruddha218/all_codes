#!/usr/bin/perl
use strict; 
use warnings;

open IN1, "<C:/Users/apawar/Documents/lab/lijuin/data_for_paper/tcga_match_ID.txt" or die "cannot open file IN1: $!";
open IN2, "<C:/Users/apawar/Documents/lab/lijuin/data_for_paper/cnv_genebygene/TCGA_copynumber_genebygene.txt" or die "cannot open file IN2: $!";
open OUT1, ">C:/Users/apawar/Documents/lab/lijuin/data_for_paper/cnv_genebygene/TCGA_copynumber_genebygene_namestrail.txt" or die "cannot open file OUT1: $!";

my %ash;
my @ary=();
while (<IN1>){
	chomp $_;
	@ary= split ("\t",$_);
	#if ($ary!= "->"){
	($ash{$ary[1]}=$ary[0]);
	#}
	}
close (IN1);



while ( my $line = <IN2> ) {

    $line =~ s/$_/$ash{$_}/g for keys %ash;
    print OUT1 $line;
}

close (IN2);
close (OUT1);

# my $flag=1;
# while (<IN2>){
	# if $flag==1{
		# chomp $_;
		# my @ary=split("\t",$_);
		# foreach my $de(@ary){
			# if $de (keys(%ash)) ~s///;
			# }
		# $flag++;
		# }else{
		# print $_;
		# print "\n";
		# }
	# }