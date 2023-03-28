/******************************************
  Provider configuration
 *****************************************/
provider "akamai" {
  # edgerc refers to the Akamai EdgeGrid authentication file that contains your Akamai API tokens. Typically ~/.edgerc.
  edgerc = "~/.edgerc"

  # config_section refers to the section inside the edgerc file which can contain multiple sets of Akamai API tokens. Typically default.
  config_section = "default"
}

/******************************************
  CORE NEW SECURITY CCONFIGURATION Module
 *****************************************/
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