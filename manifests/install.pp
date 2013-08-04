# == Class polipo::intall
# This class is meant to be called from polipo
# It install requires packages
class polipo::install {
  include polipo::params
  package { $polipo::params::pkgname:
    ensure => present,
  }
  file { '/var/log/polipo':
    ensure  => directory,
    owner   => 'polipo',
    group   => 'polipo',
    mode    => '0750',
    require => Package[$polipo::params::pkgname],
  }
}
