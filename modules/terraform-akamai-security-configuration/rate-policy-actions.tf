resource "akamai_appsec_rate_policy_action" "appsec_rate_policy_page_view_requests_action" {
  depends_on         = [akamai_appsec_rate_protection.rate_protection]
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.rate_policy_page_view_requests.rate_policy_id
  ipv4_action        = var.ratepolicy_page_view_requests_action
  ipv6_action        = var.ratepolicy_page_view_requests_action
}

resource "akamai_appsec_rate_policy_action" "appsec_rate_policy_origin_error_action" {
  depends_on         = [akamai_appsec_rate_protection.rate_protection]
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.rate_policy_origin_error.rate_policy_id
  ipv4_action        = var.ratepolicy_origin_error_action
  ipv6_action        = var.ratepolicy_origin_error_action
}

resource "akamai_appsec_rate_policy_action" "appsec_rate_policy_post_requests_action" {
  depends_on         = [akamai_appsec_rate_protection.rate_protection]
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.rate_policy_post_requests.rate_policy_id
  ipv4_action        = var.ratepolicy_post_requests_action
  ipv6_action        = var.ratepolicy_post_requests_action
}

resource "akamai_appsec_rate_policy_action" "appsec_rate_policy_forward_requests_action" {
  depends_on         = [akamai_appsec_rate_protection.rate_protection]
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.rate_policy_forward_requests.rate_policy_id
  ipv4_action        = var.ratepolicy_forward_requests_action
  ipv6_action        = var.ratepolicy_forward_requests_action
}

resource "akamai_appsec_rate_policy_action" "appsec_rate_policy_sensitive_resources_action" {
  depends_on         = [akamai_appsec_rate_protection.rate_protection]
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.rate_policy_sensitive_resources.rate_policy_id
  ipv4_action        = var.ratepolicy_sensitive_resources_action
  ipv6_action        = var.ratepolicy_sensitive_resources_action
}