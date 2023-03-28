output "config_id" {
  description = "The ID of the Akamai security configuration created"
  value       = akamai_appsec_configuration.akamai_appsec.config_id
}

output "security_policy_id" {
  description = "The ID of the Akamai security policy created"
  value       = akamai_appsec_security_policy.security_policy.security_policy_id
}