#!/usr/bin/env perl

package PerlCMS::Block;
use Moose::Role;

has 'env' => (
    is       => 'ro',
    isa      => 'HashRef',
    required => 1,
);

has 'content_type' => (
    is         => 'rw',
    isa        => 'Str',
    lazy_build => 1,
);

sub _build_content_type {
    my ($self) = @_;
    return 'text/plain; charset=utf-8';
}

has 'status_code' => (
    is         => 'rw',
    isa        => 'Str',
    lazy_build => 1,
);

sub _build_status_code {
    my ($self) = @_;
    return '200';
}

has 'body' => (
    is         => 'rw',
    isa        => 'Str',
    lazy_build => 1,
);

sub _build_body {
    my ($self) = @_;
    return 'Hello world!';
}

no Moose::Role;

1;
