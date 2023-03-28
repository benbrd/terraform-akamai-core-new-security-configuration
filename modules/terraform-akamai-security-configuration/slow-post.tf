resource "akamai_appsec_slow_post" "slow_post" {
  depends_on                 = [akamai_appsec_slowpost_protection.slowpost_protection]
  config_id                  = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id         = akamai_appsec_security_policy.security_policy.security_policy_id
  slow_rate_action           = var.slow_post_protection_action
  slow_rate_threshold_rate   = 10
  slow_rate_threshold_period = 60
}

