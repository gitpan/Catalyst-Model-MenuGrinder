package MyApp::Model::Menu;
our $VERSION = '0.05';

use base qw/Catalyst::Model::MenuGrinder/;

__PACKAGE__->config(
  menu_config => {
    plugins => {
      loader => 'XMLLoader',
      on_load => [
        'DefaultTarget',
      ],
      per_request => [
        'FileReloader',
        'Variables',
        'ActivePath',
      ],
    },
    filename => MyApp->path_to('root', 'menu.xml'),
  },
);

1;

