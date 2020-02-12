class profile::cd4pe (
  Array[String[1]] $packages = ['git','vim']
) {

  package { $packages:
    ensure => present
  }

}
