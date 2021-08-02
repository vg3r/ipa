#!/usr/bin/perl

use warnings;
use strict;

my @a = `ifconfig -a`;
for(@a){
  if (/(^\w.*?:)/ || /(\s+inet6?.*?(?:\d+\.\d+\.\d+\.\d+))/ || /(\s+inet6?.*?[\w\:]+)/){
	   print("$1\n");
  }
}
