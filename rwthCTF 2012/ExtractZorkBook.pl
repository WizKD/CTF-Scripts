#!/usr/bin/perl
use Data::Dumper;
my $count = 1;
my @files = </root/Desktop/Zork/*>;

foreach my $indFile (@files){
	my $out = "$indFile.out";
	my @flags = ();
	printf ("Opened $indFile for parsing\n");
	open (FILE, "<", $indFile);
	while (<FILE>){
		if ($_=~/(\d{19}\d?)/g) {
			push (@flags, $_);
			printf ("Found $_\n");
		}
	}
	open (OUT, ">",$out);
	select OUT;
	print (@flags);
	
	select STDOUT;
	close OUT;
	close FILE;	
	
}
