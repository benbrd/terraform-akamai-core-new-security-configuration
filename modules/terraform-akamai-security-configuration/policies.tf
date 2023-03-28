resource "akamai_appsec_security_policy" "security_policy" {
  config_id              = akamai_appsec_configuration.akamai_appsec.config_id
  default_settings       = false
  security_policy_name   = var.policy_name
  security_policy_prefix = var.policy_prefix
}