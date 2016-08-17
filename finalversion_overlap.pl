#!/usr/bin/perl
# Disclaimers : The logic has been discussed with a few labmates and seniors including Ambily Sivadas and Lavanya Rishishwar 
use warnings;
use strict;


############################
#This program will take in two bed files, the first corresponding to the intronic regions and the second to transposable elements and will return all TEs that completely #reside within introns
############################

#Push the entire intron file into a 2-D array
###################################

my @intron;

open INTRON, "<$ARGV[0]";
my $i = 0;
while(<INTRON>)
{
    chomp $_;
    my @intronline = split(/\s+/, $_);
    push(@intron, [ @intronline ]);
}
close INTRON;

##################################


####################################
#open the TE file and read each entry one by one. Check for that entry in the intron file. The search area has been restricted and so not all the reads of the Intron file are #look#ed at, to find if overlap exists or not!
open TE, "<$ARGV[1]" ;
my $tracker = 0;
my $intronsize = scalar @intron;
while(<TE>)
{
    chomp $_;
    my @teline = split(/\s+/, $_);
    my $currentPtr = $tracker;
    my $seen = 0;
    
    while($currentPtr < $intronsize)
	{
	if($intron[$currentPtr][0] ne $teline[0] && $seen == 1){
	    # crossed the chromosome
	    last;
	}
        elsif($intron[$currentPtr][0] ne $teline[0] && $seen == 0)
	{
	    # Not yet reached the chromosome
	    $currentPtr++;
	    $tracker = $currentPtr;
	    next;
	}
	$seen = 1;
	if($intron[$currentPtr][1] > $teline[2]){
	    #the te file is lagging
	    last;
	}
	if($intron[$currentPtr][2] < $teline[1])
	{
	    # the intron file is laggin
	    $currentPtr++;
	    
	    if($intron[$tracker][2] < $intron[$currentPtr][2])
		{
		$tracker = $currentPtr;
	    }
	    next;
	}
	
	if($intron[$currentPtr][1] <= $teline[1] && $intron[$currentPtr][2] >= $teline[2] )
	{
	    
	    print "$teline[0]\t$teline[1]\t$teline[2]\n";
	    last;
	}
	$currentPtr++;
    }
}
close TE;

