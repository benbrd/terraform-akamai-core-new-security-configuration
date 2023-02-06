# Akamai New Security Configuration Terraform CORE module

`Akamai New Security Configuration Terraform CORE module` makes it easy to create a new Akamai security configuration following Akamai Professional Services Best Practices and creates associated Akamai resources required.

You will end up with a security configuration that:

- Has all default Network-Lists allowed or blocked.
- Has a single security policy (a policy that employs the default values).
- Has the IP/Geo Firewall enabled with corresponding Network-Lists allowed or blocked.
- Has five rate policies: Page View Requests, Origin Errors, POST or PUT Requests, Forward Requests, and Sensitive Resources. In all five policies, both the IPv4 and the IPv6 actions are set to alert.
- Has slow POST protection enabled using the default values. This includes setting the slow POST action to alert.
- Doesn't have any custom rules.
- Has Web Application Firewall enabled and the action set to alert for all attack groups.
- Has a single match target: All Hostnames (not matching file path /failover/*).
- Has Evasive URL Request Matching enabled.
- Has Strip Pragma Debug Headers enabled with a specific random header value generated.
- Has all default reputation profiles if Client Reputation is enabled.
- Has default custom bot categories if Bot Manager is enabled.
- Has the ability to activate the Akamai security configuration created into Akamai STAGING or PRODUCTION network

# Usage

## Run it as a standalone project

1. Clone the repository, using following command:

```bash
> git clone https://github.com/brrbrr/terraform-akamai-core-new-security-configuration.git
> cd terraform-akamai-core-new-security-configuration
```

2. Copy sample `terraform.tfvars.sample` into `terraform.tfvars` and specify required variables there.

 > `contract_id` and `group_name` variables values can be found in Akamai Control Center or by using the Akamai API/CLI to find these values (<https://techdocs.akamai.com/api-definitions/reference/get-contracts-groups>).

3. Run `terraform init` to download required providers and modules.
4. Run `terraform plan` to see the infrastructure plan
5. Run `terraform apply` to apply the Terraform configuration and create required infrastructure.

Note: Run `terraform destroy` when you don't need these resources.
## Run it as a Terraform module

This way allows integration with your existing Terraform configurations.
Basic usage of this module is as follows:

```hcl
module "example" {
	 source  = "./terraform-akamai-core-new-security-configuration"

	 # Required variables
	 contract_id	= "<contract_id>"
	 group_name  	= "<group_name>"
	 hostnames  	= ["www.example.com"]
	 name  		= "WAF Security Configuration"

	 # Optional variables
	 activate  			= "false"
	 applyBotmanControls  		= "false"
	 applyReputationControls  	= "false"
	 description  			= "WAF Security Configuration created via Terraform"
	 network  			= "STAGING"
	 nl_prefix  			= "NL"
	 note  				= "Activated by Terraform"
	 notification_emails  		= ["contact@example.com"]
}
```

## Example

- [AAP+ASM Integration](./examples/AAP+ASM) - Creates a new Akamai AAP+ASM Security Configuration using `terraform-akamai-core-new-security-configuration` module to protect one hostname and activate it to Akamai STAGING network.
<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->

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

## Resources

| Name | Type |
|------|------|
| [akamai_appsec_activations.activation](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_activations) | resource |
| [akamai_networklist_network_list.network-lists-geoblock-list](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_network_list) | resource |
| [akamai_networklist_network_list.network-lists-ipblock](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_network_list) | resource |
| [akamai_networklist_network_list.network-lists-ipblock-list-exceptions](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_network_list) | resource |
| [akamai_networklist_network_list.network-lists-pragmabypass-list](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_network_list) | resource |
| [akamai_networklist_network_list.network-lists-rcbypass-list](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_network_list) | resource |
| [akamai_networklist_network_list.network-lists-securitybypass-list](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/networklist_network_list) | resource |
| [akamai_appsec_configuration.config](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/appsec_configuration) | data source |
| [akamai_group.group](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/group) | data source |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bot-manager"></a> [bot-manager](#module\_bot-manager) | ./modules/terraform-akamai-bot-manager | n/a |
| <a name="module_client-reputation"></a> [client-reputation](#module\_client-reputation) | ./modules/terraform-akamai-client-reputation | n/a |
| <a name="module_security-configuration"></a> [security-configuration](#module\_security-configuration) | ./modules/terraform-akamai-security-configuration | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Akamai contract ID associated with the new configuration. | `string` | n/a | yes |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Akamai group ID associated with the new configuration. Groups are part of an Akamai contract. | `string` | n/a | yes |
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | Names of the selectable hosts to be protected by the configuration. Note that host names are passed as an array; that's what the square brackets surrounding are for. For example ["www1.example.com", "www2.example.com"] | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Unique name to be assigned to the new security configuration. | `string` | n/a | yes |
| <a name="input_activate"></a> [activate](#input\_activate) | Choose to activate or not your Akamai Security configuration | `string` | `"false"` | no |
| <a name="input_applyBotmanControls"></a> [applyBotmanControls](#input\_applyBotmanControls) | Enable Bot Manager protections | `string` | `"false"` | no |
| <a name="input_applyReputationControls"></a> [applyReputationControls](#input\_applyReputationControls) | Enable Client-Reputation protections | `string` | `"false"` | no |
| <a name="input_description"></a> [description](#input\_description) | Brief description of the configuration and its intended purpose. | `string` | `"Web Security Configuration"` | no |
| <a name="input_network"></a> [network](#input\_network) | Name of the network the configuration is being activated for. Allowed values are: STAGING or PRODUCTION | `string` | `"STAGING"` | no |
| <a name="input_nl_prefix"></a> [nl\_prefix](#input\_nl\_prefix) | The prefix name of netwok lists which will be created (Best practice: same name as configuration\_name) | `string` | `"NL"` | no |
| <a name="input_note"></a> [note](#input\_note) | Information about the configuration and the reason for its activation. | `string` | `"Activated by Terraform"` | no |
| <a name="input_notification_emails"></a> [notification\_emails](#input\_notification\_emails) | JSON array of email addresses of people to be notified when activation is complete. To send notification emails to multiple people, separate the individual email addresses by using commas: ["user1@mail.com", "user2@mail.com"] | `list(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->
# Contributing
  
We're happy to accept help from fellow code-monkeys.
Report issues/questions/feature requests on in the [issues](https://github.com/brrbrr/terraform-akamai-core-new-security-configuration/issues) section.
Refer to the [contribution guidelines](./contributing.md) for information on contributing to this module.

# Authors

- [@Benjamin Brouard](https://www.github.com/brrbrr), Security Professional Services @Akamai.
  
> Special thanks to [@Jean-Jacques Joachim](https://www.github.com/jjoachim3) and [@Thomas Comte](https://www.github.com/tcomte89) for their inputs and peer-reviews.
  
# License

[Apache License 2](https://choosealicense.com/licenses/apache-2.0/). See [LICENSE](./LICENSE.md) for full details.
