# == Class polipo::service
# This class is meant to be called from polipo
# It ensure the service is running
class polipo::service {
  include polipo::params
  service { $polipo::params::service:
    ensure    => running,
    enable    => true,
    hasstatus => $polipo::params::hasstatus,
  }
}
