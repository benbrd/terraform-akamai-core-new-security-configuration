// Enable/Disable Protections for security_policy

resource "time_sleep" "wait0" {
  depends_on      = [akamai_appsec_security_policy.security_policy]
  create_duration = "5s"
}

resource "akamai_appsec_ip_geo_protection" "ip_geo_protection" {
  depends_on         = [time_sleep.wait0]
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  enabled            = var.applyNetworkLayerControls
}

resource "akamai_appsec_rate_protection" "rate_protection" {
  depends_on         = [akamai_appsec_ip_geo_protection.ip_geo_protection]
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  enabled            = var.applyRateControls
}

resource "akamai_appsec_slowpost_protection" "slowpost_protection" {
  depends_on         = [akamai_appsec_rate_protection.rate_protection]
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  enabled            = var.applySlowPostControls
}

resource "akamai_appsec_waf_protection" "waf_protection" {
  depends_on         = [akamai_appsec_slowpost_protection.slowpost_protection]
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  enabled            = var.applyApplicationLayerControls
}

resource "akamai_appsec_api_constraints_protection" "api_constraints_protection" {
  depends_on         = [akamai_appsec_waf_protection.waf_protection]
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  enabled            = var.applyApiConstraints
}