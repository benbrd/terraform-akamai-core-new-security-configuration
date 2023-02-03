variable "contract_id" {
  description = "Akamai contract ID associated with the new configuration. " 
  type = string
}

variable "group_name" {
  description = "Akamai group ID associated with the new configuration. Groups are part of an Akamai contract."
  type = string
}

variable "name" {
  description = "Unique name to be assigned to the new security configuration."
  type = string
}

variable "description" {
  description = "Brief description of the configuration and its intended purpose."
  type = string
}

variable "hostnames" {
  description = "Names of the selectable hosts to be protected by the configuration. Note that host names are passed as an array; that's what the square brackets surrounding are for. For example [\"www1.example.com\", \"www2.example.com\"]"
  type = list(string)
}

variable "policy_name" {
  description = "Unique name to be assigned to the new policy."
  type    = string
}

variable "policy_prefix" {
  description = "Four-character prefix used to construct the security policy ID. "
  type    = string
}

variable "ipblock_list_id" {
  description = "Unique identifier of the IP Block List network list" 
  type = string
}

variable "ipblock_list_exceptions_id" {
  description = "Unique identifier of the IP Block List Exception network list" 
  type = string
}

variable "geoblock_list_id" {
  description = "Unique identifier of the IP Geo Block List network list" 
  type = string
}

variable "securitybypass_list_id" {
  description = "Unique identifier of the Security Bypass List network list" 
  type = string
}

variable "rcbypass_list_id" {
  description = "Unique identifier of the Rate Control Bypass List network list" 
  type = string
}

variable "pragmabypass_list_id" {
  description = "Unique identifier of the Pragma Bypass List network list" 
  type = string
}

variable "applyNetworkLayerControls" {
  description = "Enable network protections" 
  type    = string
  default = "true"
}
variable "applyRateControls" {
  description = "Enable rate controls protections" 
  type    = string
  default = "true"
}
variable "applySlowPostControls" {
  description = "Enable slow POST protections" 
  type    = string
  default = "true"
}
variable "applyApplicationLayerControls" {
  description = "Enable Web Application Firewall protections" 
  type    = string
  default = "true"
}
variable "applyApiConstraints" {
  type    = string
  default = "false"
}


# the following variables reflect the ACTION for each of the Rate Policies and Slow POST Protection. Can be set to ALERT, DENY or NONE.
variable "ratepolicy_page_view_requests_action" {
  description = "Action taken any time the rate policy is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."
  type    = string
  default = "alert"
}
variable "ratepolicy_origin_error_action" {
  description = "Action taken any time the rate policy is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."
  type    = string
  default = "alert"
}
variable "ratepolicy_post_requests_action" {
  description = "Action taken any time the rate policy is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."
  type    = string
  default = "alert"
}
variable "ratepolicy_forward_requests_action" {
  description = "Action taken any time the rate policy is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."
  type    = string
  default = "alert"
}
variable "ratepolicy_sensitive_resources_action" {
  description = "Action taken any time the rate policy is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."
  type    = string
  default = "alert"
}
variable "slow_post_protection_action" {
  description = "Action to be taken if slow POST protection is triggered. Allowed values are: alert=Record the event / abort=Block the request." 
  type    = string
  default = "alert" 
}

variable "attack_group_web_attack_tool_action" {
  description = "Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action." 
  type    = string
  default = "alert"
}
variable "attack_group_web_protocol_attack_action" {
  description = "Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."
  type    = string
  default = "alert"
}
variable "attack_group_sql_injection_action" {
  description = "Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."
  type    = string
  default = "alert"
}
variable "attack_group_cross_site_scripting_action" {
  description = "Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."  
  type    = string  
  default = "alert"
}
variable "attack_group_local_file_inclusion_action" {
  description = "Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."
  type    = string
  default = "alert"
}
variable "attack_group_remote_file_inclusion_action" {
  description = "Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."
  type    = string
  default = "alert"
}
variable "attack_group_command_injection_action" {
  description = "Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."
  type    = string
  default = "alert"
}
variable "attack_group_web_platform_attack_action" {
  description = "Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."
  type    = string
  default = "alert"
}
variable "attack_group_web_policy_violation_action" {
  description = "Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."
  type    = string
  default = "alert"
}
variable "attack_group_total_outbound_action" {
  description = "Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny_custom_{custom_deny_id}=Take the action specified by the custom deny. / none=Take no action."
  type    = string
  default = "none" 
}