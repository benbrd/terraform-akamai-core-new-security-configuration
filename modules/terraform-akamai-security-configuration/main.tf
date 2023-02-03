resource "akamai_appsec_configuration" "akamai_appsec" {
  contract_id = var.contract_id
  group_id    = trimprefix(data.akamai_group.group.id, "grp_")
  name        = var.name
  description = var.description
  host_names  = var.hostnames
}

data "akamai_group" "group" {
  group_name  = var.group_name
  contract_id = var.contract_id
}