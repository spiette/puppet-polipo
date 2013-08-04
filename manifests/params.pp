# == Class polipo::params
# This class is meant to be called from polipo
# It set variable according to platform
class polipo::params {
  $pkgname = 'polipo'
  $service = 'polipo'
  $conffile = $::osfamily ? {
    default  => '/etc/polipo/config',
  }
  if $::osfamily == 'RedHat' and $::operatingsystemmajrelease < 7 {
    $logfile = '/var/log/polipo'
  } else {
    $logfile = '/var/log/polipo/polipo.log'
  }
  $group = $::osfamily ? {
    'Debian' => 'proxy',
    'RedHat' => 'polipo',
    default  => 'nobody',
  }
}
