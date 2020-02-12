class profile::dns(

){

  package { 'dnsmasq':
    ensure => present,
  }

  service { 'dnsmasq':
    ensure  => running,
    enable  => true,
    require => Package['dnsmasq'],
  }

  file_line { 'Enable local DNS lookups':
    ensure  => present,
    path    => '/etc/resolv.conf',
    line    => "nameserver ${facts['networking']['ip']}",
    after   => '^search',
    require => Service['dnsmasq'],
  }

}
