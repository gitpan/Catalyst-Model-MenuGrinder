
use strict;
use warnings;



use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t t/MyApp/t/*.t'
                                 },
                       'NAME' => 'Catalyst::Model::MenuGrinder',
                       'DISTNAME' => 'Catalyst-Model-MenuGrinder',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.11'
                                               },
                       'AUTHOR' => 'Andrew Rodland <andrew@hbslabs.com>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'A Catalyst model base-class for using WWW::MenuGrinder',
                       'EXE_FILES' => [],
                       'VERSION' => '0.04',
                       'PREREQ_PM' => {
                                        'Scope::Guard' => '0',
                                        'WWW::MenuGrinder' => '0.04',
                                        'Catalyst' => '5.7012'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



