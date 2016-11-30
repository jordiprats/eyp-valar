class valar::morghulis($custom_message='Valar Dohaeris') inherits valar::params {
  include ::valar

  fail($custom_message)
}
