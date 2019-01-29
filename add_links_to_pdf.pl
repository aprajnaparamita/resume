#!/usr/bin/env perl

use strict;
use PDF::API2;
use Data::Dumper qw/Dumper/;

# Copied these from the console.log for $('a') link list using the
# offsetLeft/offsetTop Javascript properties.


my $links  = [
  ["jjeffus","https://github.com/jjeffus",62,102,50,19],
  ["Janet Jeffus","https://www.linkedin.com/in/janet-jeffus-b0709720/",62,158,94,19],
  ["janetjeffus","http://jjeff.us",62,214,86,19],
  ["jjeff.us","http://jjeff.us",62,271,54,19],
  ["the source on Github!","https://github.com/jjeffus/resume",20,810,230,19]
];

#my $links = [
#  ["(310) 904-3836","tel:+13109043836",62,386,104,19],
#  ["speak\@jjeff.us","mailto:speak\@jjeff.us",62,443,97,19],
#  ["jjeffus","https://github.com/jjeffus",62,499,42,19],
#  ["Janet Jeffus","https://www.linkedin.com/in/janet-jeffus-b0709720/",62,555,83,19],
#  ["janetjeffus","https://twitter.com/janetjeffus",62,612,71,19],
#  ["jjeff.us","http://jjeff.us",62,668,45,19],
#  ["the source on Github!","https://github.com/jjeffus/resume",20,1017,230,19]];
  #["guard,","https://github.com/guard/guard",108,18,43,19],
  #["paper.css,","https://github.com/cognitom/paper-css",172,18,68,19],
  #["fontawesome,","https://fontawesome.com/",0,37,95,19],
  #["transfonter","https://transfonter.org/",118,37,74,19],
  #["combine_pdf. Among other things. Check out","https://github.com/boazsegev/combine_pdf",0,55,240,37],

sub draw_url
{
     my ($pdf, $page_num, $dims, $url) = @_;

     my $page = $pdf->openpage($page_num);
     my $an = $page->annotation;
     $$dims[0] *= 0.75; # Ratio of pixels to pt
     $$dims[0] += 18;
     # $$dims[1] += 43;
     $$dims[2] *= 0.75;
     $$dims[2] += 18;
     # $$dims[3] += 43;
     $an->url($url, (-rect => $dims)); #, (-border => [1, 1, 1]));
     # $an->url($url, (-rect => $dims), (-border => [1, 1, 1]));
     $page->update;
}

my $infile = shift @ARGV;
my $pdfa2 = PDF::API2->open($infile);
my $page = $pdfa2->openpage(2);
(my $llx, my $lly, my $urx, my $ury) = $page->get_mediabox;

print "x: $llx y: $lly w: $urx h $ury\n";

# draw_url($pdfa2, 1, [150, 200, 50, 50], "http://test.com");

foreach my $link (@$links) {
  my $dims = [$link->[2],
              ($ury - ($link->[3]) * 0.75) - 155,
              $link->[2]+$link->[4],
              ($ury - (($link->[3] + $link->[5]) * 0.75)) - 155];
  draw_url($pdfa2, 2, $dims, $link->[1]);
  draw_url($pdfa2, 3, $dims, $link->[1]);
}

$pdfa2->saveas("final.pdf");
print "Writing: final.pdf\n";
$pdfa2->end;
