#!/usr/bin/env perl

use strict;
use warnings;
use lib qw(lib);

use PerlCMS;

my $perlcms = PerlCMS->new();

sub {
    my ($env) = @_;
    return $perlcms->handle_request($env);
}
