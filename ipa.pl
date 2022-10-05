#!/usr/bin/perl -w

use warnings;
use strict;
use Getopt::Std;


# Exclude 'darwin' from ipconfig
my @ints = ($^O =~ /Win32|cygwin/) ? `ipconfig /all` : `ifconfig -a`;
@ints = grep { /^\w|inet6?|IPv[46]/ } @ints;
s/^(\S+).*/$1/, s/.*?inet6?.*?(\s+\S+).*/$1/, s/IPv[46].*?:(\s+\S+).*/$1/ for @ints;

my %opts;
getopts('hu6', \%opts);
if ($opts{h}) {
    print "\n";
    print "./ipa.pl - IP Address list.  Enter a valid option:\n";
    print "\n";
    print "\t-6 Include IPv6 addresses\n\n";
    print "\t-u Include unassigned interfaces\n\n";
}
elsif ($opts{u}) {
    print $_ for @ints;
}
elsif ($opts{6}) {
    while (@ints) {
        my $p = shift(@ints);
        print $p if $p =~ /^\s/;
        print $p if $p =~ /^\S/ && $ints[0] !~ /^\S/;
    }
}
else {
    @ints = grep { !/:.*:/ } @ints;
    while (@ints) {
        my $p = shift(@ints);
        print $p if $p =~ /^\s/;
        print $p if $p =~ /^\S/ && ($ints[0] && $ints[0] !~ /^\S/);
    }
}
