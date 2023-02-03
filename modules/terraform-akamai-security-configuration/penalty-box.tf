// Penalty Box
resource "akamai_appsec_penalty_box" "penalty_box" {
  depends_on             = [akamai_appsec_waf_protection.waf_protection]
  config_id              = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id     = akamai_appsec_security_policy.security_policy.security_policy_id
  penalty_box_protection = true
  penalty_box_action     = "alert"
}