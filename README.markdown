# polipo

[![Build Status](https://travis-ci.org/spiette/puppet-polipo.png?branch=master)](https://travis-ci.org/spiette/puppet-polipo)

This is the polipo module.  [Polipo](http://www.pps.univ-paris-diderot.fr/~jch/software/polipo/)
is the web caching proxy. You can pass any polipo configuration option with the
options parameter.

# Requirements

- Debian-based or RedHat-based distribution

# Installation

  puppet module install spiette/polipo

# Synopsis

    class { 'polipo':
      options => {
        allowedClients => '127.0.0.1, 192.168.122.0/24'
      }
    }

# Parameters

- *options*

  You can pass any polipo configuration option with the option parameter, as shown in the synopsis.

# License

  See LICENSE

# Support

Please log tickets and issues at our [project site](https://github.com/spiette/polipo)
