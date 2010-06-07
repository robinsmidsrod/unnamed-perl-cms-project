#!/usr/bin/env perl

package PerlCMS;
use Moose;

sub handle_request {
    my ($self, $env) = @_;
    my $block = $self->dispatch($env);
    unless ( blessed($block) and $block->DOES('PerlCMS::Block') ) {
        confess("No block instance returned from dispatch()!");
    }
    return [
        $block->status_code,
        [ 'Content-Type' => $block->content_type ],
        [ $block->body ],
    ];
}

sub dispatch {
    my ($self, $env) = @_;
    my $block_class = $self->resolve_block($env);
    unless ( defined($block_class) ) {
        confess("No block class name returned from resolve_block()!");
    }
    Class::MOP::load_class($block_class);
    return $block_class->new( env => $env );
}

sub resolve_block {
    my ($self, $env) = @_;
    my $class_name = 'PerlCMS::Block::Core::NotFound';
    if ( $env->{'REQUEST_URI'} eq '/' ) {
        $class_name = 'PerlCMS::Block::Core::DumpEnv';
    }
    return $class_name;
}

no Moose;
__PACKAGE__->meta->make_immutable();

1;
