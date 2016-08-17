# sortedBedIntersection
Optimized Perl script for bed intersection (identifying transposable elements within introns)



The script was written as part of a competion in the Programming for Bioinformatics course at Georgia Tech.
Here is the problem statement that was given to us :


'TE.bed' contains the complete annotated set of transposable element sequences in the human reference genome. 'Intron.bed' is the complete annotated set of introns in the human reference genome. 

Your test case will be to find all of those TE sequences which reside entirely within introns. This number is about 1,923,000 depending on <= vs. < usage and zero and one-based coordinates. 
Anything under 5 minutes is quite good, though a number of people got under 30s last year.

The intron.bed file has been added to the Data folder
The TE.bed can be downloaded from https://www.dropbox.com/s/gd0iqq7plcmv1a6/TE.rar?dl=0

Usage

./finalversion_overlap.pl Intron.bed TE.bed > output_file

