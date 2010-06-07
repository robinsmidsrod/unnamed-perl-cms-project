#!/usr/bin/env perl

package PerlCMS::Block::Core::DumpEnv;
use Moose;
with 'PerlCMS::Block';

sub _build_body {
    my ($self) = @_;
    return join("\n", map { $_ . ' = ' . $self->env->{$_} } sort keys %{ $self->env } );
}

no Moose;
__PACKAGE__->meta->make_immutable();

1;
