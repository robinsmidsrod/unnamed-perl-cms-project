#!/usr/bin/env perl

package PerlCMS::Block::Core::NotFound;
use Moose;
with 'PerlCMS::Block';

sub _build_status_code {
    my ($self) = @_;
    return '404';
}

sub _build_body {
    my ($self) = @_;
    return 'NOT FOUND';
}

no Moose;
__PACKAGE__->meta->make_immutable();

1;
