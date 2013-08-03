# == Class: polipo
#
# This class will install, configure and run polipo web caching service.
#
# === Parameters
#
# Document parameters here.
#
# [*options*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Examples
#
#  class { polipo:
#    options  => {
#      'key1' => 'value1',
#      'key2' => 'value2',
#  }
#
# === Authors
#
# Simon Piette <piette.simon@gmail.com>
#
# === Copyright
#
# Copyright 2013 Simon Piette
#
class polipo () {
  anchor { "${module_name}::begin": } ->
  class {"${module_name}::install": } ->
  class {"${module_name}::config": } ~>
  class {"${module_name}::service": } ~>
  anchor { "${module_name}::end": }
}
