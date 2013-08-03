# == Class polipo::config
# This class is meant to be called from polipo
# it bakes the configuration file
# === Parameters
#
# [*options*]
#   A hash of extra options to set in the configuration
#
# === Example
#
#  class { polipo:
#    options => {
#      'key1' => 'value1',
#      'key2' => 'value2',
#    }
#  }
class polipo::config(
    $options=$polipo::options,
    ) {
  include polipo::params
  file { $polipo::params::conffile:
    ensure  => present,
    mode    => '0440',
    content => template('polipo/config.erb')
  }
}

