class valar::install inherits valar {

  if($valar::manage_package)
  {
    package { $valar::params::package_name:
      ensure => $valar::package_ensure,
    }
  }

}
