use strict;
use warnings;

my $name = <>;
my @states;

die "Invalid format - missing name" unless defined($name);

while (<>) {
	chomp;
	if (/\w+\_\w+$/) {
		push @states, $_;
	}
}

my $uc_name = uc($name);
$uc_name =~ s/^\s+|\s+$//g;
my $uc_array_name = $uc_name . "_names";

open(headerFile, ">$name.h") or die "Can't open $name.h: $!";
print headerFile "extern const char *$uc_array_name\[];\n";
print headerFile "typedef enum {\n   ";
print headerFile join ",\n   ", @states;
print headerFile "\n} $uc_name;";
close(headerFile);

open(sourceFile, ">$name.c") or die "Can't open $name.c: $!";
print sourceFile "const char *$uc_array_name\[] = {\n   \"";
print sourceFile join "\",\n   \"", @states;
print sourceFile "\"\n};";
close(sourceFile);
