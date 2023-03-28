// Enable/Disable Protection for security_policy
resource "akamai_appsec_reputation_protection" "reputation_protection" {
  config_id          = var.config_id
  security_policy_id = var.security_policy_id
  enabled            = true
}