package Catalyst::Model::MenuGrinder;
our $VERSION = '0.05';

# ABSTRACT: Catalyst Model base class for WWW::MenuGrinder

use base 'Catalyst::Model';

use Scope::Guard;

__PACKAGE__->mk_accessors('_menu');

sub new {
  my $class = shift;
  my $self = $class->NEXT::new(@_);

  my $config = $self->config;

  my $menu_class = $config->{menu_class} || "Catalyst::Model::MenuGrinder::Menu";
  eval "require $menu_class; 1;" or die "$@ loading menu_class";

  my $menu_config = $config->{menu_config} || {};

  my $menu = $menu_class->new(
    config => $menu_config,
  );

  $self->_menu($menu);

  return $self;
}

sub ACCEPT_CONTEXT {
  my ($self, $c) = @_;

  $c->stash->{__menu_guard} = [] unless defined $c->stash->{__menu_guard};
  push @{ $c->stash->{__menu_guard} }, Scope::Guard->new(sub {
      $self->_menu->cleanup();
    }
  );

  $self->_menu->_accept_context($c);

  return $self->_menu;
}

1;


__END__
=pod

=head1 NAME

Catalyst::Model::MenuGrinder - Catalyst Model base class for WWW::MenuGrinder

=head1 VERSION

version 0.05

=head1 SYNOPSIS


  package MyApp::Model::Menu;

  use base 'Catalyst::Model::MenuGrinder';

  __PACKAGE__->config(
    menu_config => {
      plugins => [
        'XMLLoader',
        'DefaultTarget',
        'NullOutput',
      ],
      filename => MyApp->path_to('root', 'menu.xml'),
    },
  );

=head1 AUTHOR

  Andrew Rodland <andrew@hbslabs.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by HBS Labs, LLC..

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

