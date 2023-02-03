# Akamai BOT MANAGER Terraform module

Terraform module which enable and creates default custom bot categories within the Akamai security configuration.

# Usage

Basic usage of this module is as follows:

```hcl
module "bot-manager" {
  source   = "./terraform-akamai-bot-manager"

  # Required variables
  config_id     = "<contract_id>"
  name       = "<name>"
  security_policy_id   = "<policy_id>"
}
```
<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
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
