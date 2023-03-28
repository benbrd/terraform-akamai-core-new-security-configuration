resource "akamai_appsec_ip_geo" "ip_geo_block" {
  depends_on                 = [akamai_appsec_ip_geo_protection.ip_geo_protection]
  config_id                  = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id         = akamai_appsec_security_policy.security_policy.security_policy_id
  mode                       = "block"
  ip_network_lists           = [var.ipblock_list_id]
  geo_network_lists          = [var.geoblock_list_id]
  exception_ip_network_lists = [var.ipblock_list_exceptions_id]
}
