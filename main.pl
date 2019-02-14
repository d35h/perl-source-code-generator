use strict;
use warnings;

my $name = <>;
my @states;

die "Invalid format - missing name" unless defined($name);

print "Hello world\n";

while (<>) {
	chomp;
	print "$_\n";
	if (/\w+\_\w+$/) {
		print "this value matches the pattern\n";
		push @states, $_;
	}
}

print @states;
