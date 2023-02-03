# Akamai SECURITY CONFIGURATION Terraform module
Terraform module which creates a new Akamai security configuration following Akamai Professional Services Best Practices.

You will end up with a security configuration that:

- Has a single security policy (a policy that employs the default values).
- Has the IP/Geo Firewall enabled.
- Has five rate policies: Page View Requests, Origin Errors, POST or PUT Requests, Forward Requests, and Sensitive Resources. In all five policies, both the IPv4 and the IPv6 actions are set to alert.
- Has slow POST protection enabled using the default values. This includes setting the slow POST action to alert.
- Doesn't have any custom rules.
- Has Web Application Firewall enabled and the action set to alert for all attack groups.
- Has a single match target: All Hostnames (not matching file path /failover/*).
- Has Evasive URL Request Matching enabled.
- Has Strip Pragma Debug Headers enabled with a specific random header value generated.


<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->

# Usage

Basic usage of this module is as follows:

```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 contract_id  = 
	 description  = 
	 geoblock_list_id  = 
	 group_name  = 
	 hostnames  = 
	 ipblock_list_exceptions_id  = 
	 ipblock_list_id  = 
	 name  = 
	 policy_name  = 
	 policy_prefix  = 
	 pragmabypass_list_id  = 
	 rcbypass_list_id  = 
	 securitybypass_list_id  = 

	 # Optional variables
	 applyApiConstraints  = "false"
	 applyApplicationLayerControls  = "true"
	 applyNetworkLayerControls  = "true"
	 applyRateControls  = "true"
	 applySlowPostControls  = "true"
	 attack_group_command_injection_action  = "alert"
	 attack_group_cross_site_scripting_action  = "alert"
	 attack_group_local_file_inclusion_action  = "alert"
	 attack_group_remote_file_inclusion_action  = "alert"
	 attack_group_sql_injection_action  = "alert"
	 attack_group_total_outbound_action  = "none"
	 attack_group_web_attack_tool_action  = "alert"
	 attack_group_web_platform_attack_action  = "alert"
	 attack_group_web_policy_violation_action  = "alert"
	 attack_group_web_protocol_attack_action  = "alert"
	 ratepolicy_forward_requests_action  = "alert"
	 ratepolicy_origin_error_action  = "alert"
	 ratepolicy_page_view_requests_action  = "alert"
	 ratepolicy_post_requests_action  = "alert"
	 ratepolicy_sensitive_resources_action  = "alert"
	 slow_post_protection_action  = "alert"
}
```

## Prerequisite
Authentication is handled through Akamai EdgeGrid in the _provider.tf_ file.
Ensure you have your _.edgerc_ file available and that it contains your Akamai EdgeGrid tokens separated in sections.
```bash
[default]
client_secret = xxxx
host = xxxx # unique string followed by `luna.akamaiapis.net`
access_token = xxxx
client_token = xxxx
max-body = xxxx
#account_key = xxxxx # specify the Account Switch Key to handle another another account with your Akamai Internal Credentials
```
For more information on Akamai EdgeGrid, _.edgerc_ file and creating Akamai EdgeGrid tokens, see ['Get started with APIs'](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials).


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | >= 3.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_akamai"></a> [akamai](#provider\_akamai) | >= 3.2.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Resources

| Name | Type |
|------|------|
| [akamai_appsec_advanced_settings_evasive_path_match.evasive_path_match](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_advanced_settings_evasive_path_match) | resource |
| [akamai_appsec_advanced_settings_logging.logging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_advanced_settings_logging) | resource |
| [akamai_appsec_advanced_settings_pragma_header.pragma_header](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_advanced_settings_pragma_header) | resource |
| [akamai_appsec_api_constraints_protection.api_constraints_protection](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_api_constraints_protection) | resource |
| [akamai_appsec_attack_group.attack_group_command_injection](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.attack_group_cross_site_scripting](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.attack_group_local_file_inclusion](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.attack_group_remote_file_inclusion](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.attack_group_sql_injection](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.attack_group_total_outbound](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.attack_group_web_attack_tool](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.attack_group_web_platform_attack](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.attack_group_web_policy_violation](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_attack_group.attack_group_web_protocol_attack](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_attack_group) | resource |
| [akamai_appsec_configuration.akamai_appsec](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_configuration) | resource |
| [akamai_appsec_ip_geo.ip_geo_block](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_ip_geo) | resource |
| [akamai_appsec_ip_geo_protection.ip_geo_protection](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_ip_geo_protection) | resource |
| [akamai_appsec_match_target.match_target](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_match_target) | resource |
| [akamai_appsec_penalty_box.penalty_box](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_penalty_box) | resource |
| [akamai_appsec_rate_policy.rate_policy_forward_requests](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy) | resource |
| [akamai_appsec_rate_policy.rate_policy_origin_error](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy) | resource |
| [akamai_appsec_rate_policy.rate_policy_page_view_requests](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy) | resource |
| [akamai_appsec_rate_policy.rate_policy_post_requests](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy) | resource |
| [akamai_appsec_rate_policy.rate_policy_sensitive_resources](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy) | resource |
| [akamai_appsec_rate_policy_action.appsec_rate_policy_forward_requests_action](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy_action) | resource |
| [akamai_appsec_rate_policy_action.appsec_rate_policy_origin_error_action](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy_action) | resource |
| [akamai_appsec_rate_policy_action.appsec_rate_policy_page_view_requests_action](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy_action) | resource |
| [akamai_appsec_rate_policy_action.appsec_rate_policy_post_requests_action](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy_action) | resource |
| [akamai_appsec_rate_policy_action.appsec_rate_policy_sensitive_resources_action](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_policy_action) | resource |
| [akamai_appsec_rate_protection.rate_protection](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_rate_protection) | resource |
| [akamai_appsec_security_policy.security_policy](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_security_policy) | resource |
| [akamai_appsec_slow_post.slow_post](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_slow_post) | resource |
| [akamai_appsec_slowpost_protection.slowpost_protection](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_slowpost_protection) | resource |
| [akamai_appsec_waf_mode.waf_mode](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_waf_mode) | resource |
| [akamai_appsec_waf_protection.waf_protection](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_waf_protection) | resource |
| [random_string.secret_header](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [time_sleep.wait0](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.wait1](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.wait2](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.wait3](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.wait4](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [akamai_group.group](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/group) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Akamai contract ID associated with the new configuration. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Brief description of the configuration and its intended purpose. | `string` | n/a | yes |
| <a name="input_geoblock_list_id"></a> [geoblock\_list\_id](#input\_geoblock\_list\_id) | Unique identifier of the IP Geo Block List network list | `string` | n/a | yes |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Akamai group ID associated with the new configuration. Groups are part of an Akamai contract. | `string` | n/a | yes |
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | Names of the selectable hosts to be protected by the configuration. Note that host names are passed as an array; that's what the square brackets surrounding are for. For example ["www1.example.com", "www2.example.com"] | `list(string)` | n/a | yes |
| <a name="input_ipblock_list_exceptions_id"></a> [ipblock\_list\_exceptions\_id](#input\_ipblock\_list\_exceptions\_id) | Unique identifier of the IP Block List Exception network list | `string` | n/a | yes |
| <a name="input_ipblock_list_id"></a> [ipblock\_list\_id](#input\_ipblock\_list\_id) | Unique identifier of the IP Block List network list | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Unique name to be assigned to the new security configuration. | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Unique name to be assigned to the new policy. | `string` | n/a | yes |
| <a name="input_policy_prefix"></a> [policy\_prefix](#input\_policy\_prefix) | Four-character prefix used to construct the security policy ID. | `string` | n/a | yes |
| <a name="input_pragmabypass_list_id"></a> [pragmabypass\_list\_id](#input\_pragmabypass\_list\_id) | Unique identifier of the Pragma Bypass List network list | `string` | n/a | yes |
| <a name="input_rcbypass_list_id"></a> [rcbypass\_list\_id](#input\_rcbypass\_list\_id) | Unique identifier of the Rate Control Bypass List network list | `string` | n/a | yes |
| <a name="input_securitybypass_list_id"></a> [securitybypass\_list\_id](#input\_securitybypass\_list\_id) | Unique identifier of the Security Bypass List network list | `string` | n/a | yes |
| <a name="input_applyApiConstraints"></a> [applyApiConstraints](#input\_applyApiConstraints) | n/a | `string` | `"false"` | no |
| <a name="input_applyApplicationLayerControls"></a> [applyApplicationLayerControls](#input\_applyApplicationLayerControls) | Enable Web Application Firewall protections | `string` | `"true"` | no |
| <a name="input_applyNetworkLayerControls"></a> [applyNetworkLayerControls](#input\_applyNetworkLayerControls) | Enable network protections | `string` | `"true"` | no |
| <a name="input_applyRateControls"></a> [applyRateControls](#input\_applyRateControls) | Enable rate controls protections | `string` | `"true"` | no |
| <a name="input_applySlowPostControls"></a> [applySlowPostControls](#input\_applySlowPostControls) | Enable slow POST protections | `string` | `"true"` | no |
| <a name="input_attack_group_command_injection_action"></a> [attack\_group\_command\_injection\_action](#input\_attack\_group\_command\_injection\_action) | Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_attack_group_cross_site_scripting_action"></a> [attack\_group\_cross\_site\_scripting\_action](#input\_attack\_group\_cross\_site\_scripting\_action) | Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_attack_group_local_file_inclusion_action"></a> [attack\_group\_local\_file\_inclusion\_action](#input\_attack\_group\_local\_file\_inclusion\_action) | Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_attack_group_remote_file_inclusion_action"></a> [attack\_group\_remote\_file\_inclusion\_action](#input\_attack\_group\_remote\_file\_inclusion\_action) | Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_attack_group_sql_injection_action"></a> [attack\_group\_sql\_injection\_action](#input\_attack\_group\_sql\_injection\_action) | Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_attack_group_total_outbound_action"></a> [attack\_group\_total\_outbound\_action](#input\_attack\_group\_total\_outbound\_action) | Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"none"` | no |
| <a name="input_attack_group_web_attack_tool_action"></a> [attack\_group\_web\_attack\_tool\_action](#input\_attack\_group\_web\_attack\_tool\_action) | Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_attack_group_web_platform_attack_action"></a> [attack\_group\_web\_platform\_attack\_action](#input\_attack\_group\_web\_platform\_attack\_action) | Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_attack_group_web_policy_violation_action"></a> [attack\_group\_web\_policy\_violation\_action](#input\_attack\_group\_web\_policy\_violation\_action) | Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_attack_group_web_protocol_attack_action"></a> [attack\_group\_web\_protocol\_attack\_action](#input\_attack\_group\_web\_protocol\_attack\_action) | Action taken any time the attack group is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_ratepolicy_forward_requests_action"></a> [ratepolicy\_forward\_requests\_action](#input\_ratepolicy\_forward\_requests\_action) | Action taken any time the rate policy is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_ratepolicy_origin_error_action"></a> [ratepolicy\_origin\_error\_action](#input\_ratepolicy\_origin\_error\_action) | Action taken any time the rate policy is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_ratepolicy_page_view_requests_action"></a> [ratepolicy\_page\_view\_requests\_action](#input\_ratepolicy\_page\_view\_requests\_action) | Action taken any time the rate policy is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_ratepolicy_post_requests_action"></a> [ratepolicy\_post\_requests\_action](#input\_ratepolicy\_post\_requests\_action) | Action taken any time the rate policy is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_ratepolicy_sensitive_resources_action"></a> [ratepolicy\_sensitive\_resources\_action](#input\_ratepolicy\_sensitive\_resources\_action) | Action taken any time the rate policy is triggered. Allowed values are: alert=Record information about the request / deny=Block the request / deny\_custom\_{custom\_deny\_id}=Take the action specified by the custom deny. / none=Take no action. | `string` | `"alert"` | no |
| <a name="input_slow_post_protection_action"></a> [slow\_post\_protection\_action](#input\_slow\_post\_protection\_action) | Action to be taken if slow POST protection is triggered. Allowed values are: alert=Record the event / abort=Block the request. | `string` | `"alert"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config_id"></a> [config\_id](#output\_config\_id) | The ID of the Akamai security configuration created |
| <a name="output_security_policy_id"></a> [security\_policy\_id](#output\_security\_policy\_id) | The ID of the Akamai security policy created |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->
# Contributing
  
We're happy to accept help from fellow code-monkeys.
Report issues/questions/feature requests on in the [issues]() section.
Refer to the [contribution guidelines](./contributing.md) for information on contributing to this module.

# Authors

- [@Benjamin Brouard](https://www.github.com/brrbrr), Security Professional Services @Akamai.
  
> Special thanks to [@Jean-Jacques Joachim](https://www.github.com/jjoachim3) and [@Thomas Comte](https://www.github.com/tcomte89) for their inputs and peer-reviews.
  
# License

[Apache License 2](https://choosealicense.com/licenses/apache-2.0/). See [LICENSE](./LICENSE.md) for full details.
