data "akamai_group" "group" {
  group_name  = var.group_name
  contract_id = var.contract_id
}

resource "akamai_networklist_network_list" "network-lists-ipblock" {
  name        = "${var.nl_prefix}-IP Block List"
  type        = "IP"
  description = "IP Block List for ${var.name}"
  list        = []
  mode        = "REPLACE"
  contract_id = var.contract_id
  group_id    = trimprefix(data.akamai_group.group.id, "grp_")
}

resource "akamai_networklist_network_list" "network-lists-ipblock-list-exceptions" {
  name        = "${var.nl_prefix}-IP Block List Exceptions"
  type        = "IP"
  description = "IP Block List Exceptions for ${var.name}"
  list        = []
  mode        = "REPLACE"
  contract_id = var.contract_id
  group_id    = trimprefix(data.akamai_group.group.id, "grp_")
}

resource "akamai_networklist_network_list" "network-lists-geoblock-list" {
  name        = "${var.nl_prefix}-GEO Block List"
  type        = "GEO"
  description = "GEO Block List for ${var.name}"
  list        = []
  mode        = "REPLACE"
  contract_id = var.contract_id
  group_id    = trimprefix(data.akamai_group.group.id, "grp_")
}

resource "akamai_networklist_network_list" "network-lists-securitybypass-list" {
  name        = "${var.nl_prefix}-Security Bypass List"
  type        = "IP"
  description = "Security Bypass List for ${var.name}"
  list        = []
  mode        = "REPLACE"
  contract_id = var.contract_id
  group_id    = trimprefix(data.akamai_group.group.id, "grp_")
}

resource "akamai_networklist_network_list" "network-lists-rcbypass-list" {
  name        = "${var.nl_prefix}-Rate Control Bypass List"
  type        = "IP"
  description = "Rate Control Bypass List for ${var.name}"
  list        = []
  mode        = "REPLACE"
  contract_id = var.contract_id
  group_id    = trimprefix(data.akamai_group.group.id, "grp_")
}

resource "akamai_networklist_network_list" "network-lists-pragmabypass-list" {
  name        = "${var.nl_prefix}-Pragma Bypass List"
  type        = "IP"
  description = "Pragma Bypass List for ${var.name}"
  list        = []
  mode        = "REPLACE"
  contract_id = var.contract_id
  group_id    = trimprefix(data.akamai_group.group.id, "grp_")
}

module "security-configuration" {
  source                      = "./modules/terraform-akamai-security-configuration"
  hostnames                   = var.hostnames
  name                        = var.name
  description                 = var.description
  contract_id                 = var.contract_id
  group_name                  = var.group_name
  policy_name                 = var.name
  policy_prefix               = substr(var.name,0,4)
  ipblock_list_id             = akamai_networklist_network_list.network-lists-ipblock.network_list_id
  ipblock_list_exceptions_id  = akamai_networklist_network_list.network-lists-ipblock-list-exceptions.network_list_id
  geoblock_list_id            = akamai_networklist_network_list.network-lists-geoblock-list.network_list_id
  securitybypass_list_id      = akamai_networklist_network_list.network-lists-securitybypass-list.network_list_id
  rcbypass_list_id            = akamai_networklist_network_list.network-lists-rcbypass-list.network_list_id
  pragmabypass_list_id        = akamai_networklist_network_list.network-lists-pragmabypass-list.network_list_id
  depends_on                  = [akamai_networklist_network_list.network-lists-ipblock,akamai_networklist_network_list.network-lists-ipblock-list-exceptions,akamai_networklist_network_list.network-lists-geoblock-list,akamai_networklist_network_list.network-lists-securitybypass-list,akamai_networklist_network_list.network-lists-rcbypass-list,akamai_networklist_network_list.network-lists-pragmabypass-list]
}

module "client-reputation" {
  count                   = var.applyReputationControls == "true" ? 1 : 0
  source                  = "./modules/terraform-akamai-client-reputation"
  config_id               = module.security-configuration.config_id
  security_policy_id      = module.security-configuration.security_policy_id
  depends_on              = [module.security-configuration]
}

module "bot-manager" {
  count              = var.applyBotmanControls == "true" ? 1 : 0
  source             = "./modules/terraform-akamai-bot-manager"
  config_id          = module.security-configuration.config_id
  security_policy_id = module.security-configuration.security_policy_id
  name               = var.name
  depends_on         = [module.security-configuration, module.client-reputation]
}

data "akamai_appsec_configuration" "config" {
  name                = var.name
  depends_on          = [module.security-configuration, module.bot-manager, module.client-reputation]

}

resource "akamai_appsec_activations" "activation" {
  count               = var.activate == "true" ? 1 : 0
  config_id           = module.security-configuration.config_id
  network             = upper(var.network)
  note                = var.note
  notification_emails = var.notification_emails
  version             = data.akamai_appsec_configuration.config.latest_version
  depends_on          = [module.security-configuration, module.bot-manager, module.client-reputation]
}