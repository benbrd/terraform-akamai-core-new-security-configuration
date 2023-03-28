# resource to set the Application Security mode. Currently set to Adaptive Security Engine in Automatic mode which required the least management.
resource "akamai_appsec_waf_mode" "waf_mode" {
  depends_on         = [akamai_appsec_waf_protection.waf_protection]
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  mode               = "ASE_AUTO"
}

// WAF Attack Group Actions
resource "akamai_appsec_attack_group" "attack_group_web_attack_tool" {
  depends_on          = [akamai_appsec_waf_mode.waf_mode]
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "WAT"
  attack_group_action = var.attack_group_web_attack_tool_action
}

resource "akamai_appsec_attack_group" "attack_group_web_protocol_attack" {
  depends_on          = [akamai_appsec_waf_mode.waf_mode]
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "PROTOCOL"
  attack_group_action = var.attack_group_web_protocol_attack_action
}

resource "akamai_appsec_attack_group" "attack_group_sql_injection" {
  depends_on          = [akamai_appsec_waf_mode.waf_mode]
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "SQL"
  attack_group_action = var.attack_group_sql_injection_action
}

resource "akamai_appsec_attack_group" "attack_group_cross_site_scripting" {
  depends_on          = [akamai_appsec_waf_mode.waf_mode]
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "XSS"
  attack_group_action = var.attack_group_cross_site_scripting_action
}

resource "akamai_appsec_attack_group" "attack_group_local_file_inclusion" {
  depends_on          = [akamai_appsec_waf_mode.waf_mode]
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "LFI"
  attack_group_action = var.attack_group_local_file_inclusion_action
}

resource "akamai_appsec_attack_group" "attack_group_remote_file_inclusion" {
  depends_on          = [akamai_appsec_waf_mode.waf_mode]
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "RFI"
  attack_group_action = var.attack_group_remote_file_inclusion_action
}

resource "akamai_appsec_attack_group" "attack_group_command_injection" {
  depends_on          = [akamai_appsec_waf_mode.waf_mode]
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "CMD"
  attack_group_action = var.attack_group_command_injection_action
}

resource "akamai_appsec_attack_group" "attack_group_web_platform_attack" {
  depends_on          = [akamai_appsec_waf_mode.waf_mode]
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "PLATFORM"
  attack_group_action = var.attack_group_web_platform_attack_action
}

resource "akamai_appsec_attack_group" "attack_group_web_policy_violation" {
  depends_on          = [akamai_appsec_waf_mode.waf_mode]
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "POLICY"
  attack_group_action = var.attack_group_web_policy_violation_action
}

# Total Outbound is typically set to Not Used/None because it can negatively impact performance. Enable into ALERT/DENY with care.
resource "akamai_appsec_attack_group" "attack_group_total_outbound" {
  depends_on          = [akamai_appsec_waf_mode.waf_mode]
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "OUTBOUND"
  attack_group_action = var.attack_group_total_outbound_action
}