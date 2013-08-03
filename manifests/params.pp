# == Class polipo::params
# This class is meant to be called from polipo
# It set variable according to platform
class polipo::params {
  $pkgname = 'polipo'
  $service = 'polipo'
  $conffile = $::osfamily ? {
    default  => '/etc/polipo/config',
  }
}
