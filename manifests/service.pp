class valar::service inherits valar {

  #
  validate_bool($valar::manage_docker_service)
  validate_bool($valar::manage_service)
  validate_bool($valar::service_enable)

  validate_re($valar::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${valar::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $valar::manage_docker_service)
  {
    if($valar::manage_service)
    {
      service { $valar::params::service_name:
        ensure => $valar::service_ensure,
        enable => $valar::service_enable,
      }
    }
  }
}
