#!/usr/bin/perl -w

# converts Adwait's tagged format to ours
# Adwait's format is one sentence per line, with each sentence having the 
# form
#   word1_tag1 word2_tag2

local $|=1;

while (<>) {
    s/[()]//g;
    @items = split;
    print "(";
    foreach $item (@items) {
	($word, $tag) = $item =~ /(.*)_(.*)/;
	print "($word ($tag)) ";
    }
    print ")\n";
}
