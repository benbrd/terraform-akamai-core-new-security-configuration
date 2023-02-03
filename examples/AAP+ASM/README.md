# Akamai AAP+ASM Security Integration example

This example illustrates how to create a new Akamai AAP+ASM Security Configuration using `terraform-akamai-core-new-security-configuration` module to protect one hostname and activate it to Akamai STAGING network.

# main.tf

```hcl
    module "security_config" {
      source                      = "../../"
      hostnames                   = ["waf.example.com"]
      name                        = "Example WAF Security Configuration"
      description                 = "WAF Config via TF"
      contract_id                 = "X-XXXXXX"
      group_name                  = "group1"

      nl_prefix                   = "EXTF"
      applyReputationControls     = "true"
      applyBotmanControls         = "true"

      activate                    = "true"
      network                     = "STAGING"
    }
```
# Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```
Run `terraform destroy` when you don't need these resources.

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

No providers.

## Resources

No resources.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_security_config"></a> [security\_config](#module\_security\_config) | ../../ | n/a |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->
