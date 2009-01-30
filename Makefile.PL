
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Catalyst-Model-MenuGrinder',
  NAME      => 'Catalyst::Model::MenuGrinder',
  AUTHOR    => 'Andrew\ Rodland\ \<andrew\@hbslabs\.com\>',
  ABSTRACT  => 'A Catalyst model base-class for using WWW::MenuGrinder',
  VERSION   => '0.01_01',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Scope::Guard" => '0',
    "WWW::MenuGrinder" => '0.01_01',
    "Catalyst" => '5.7012',
  },
);
