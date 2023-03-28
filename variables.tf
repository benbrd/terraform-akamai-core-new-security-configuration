variable "contract_id" {
  description = "Akamai contract ID associated with the new configuration. "
  type        = string
}

variable "group_name" {
  description = "Akamai group ID associated with the new configuration. Groups are part of an Akamai contract."
  type        = string
}

variable "name" {
  description = "Unique name to be assigned to the new security configuration."
  type        = string
}

variable "description" {
  description = "Brief description of the configuration and its intended purpose."
  type        = string
  default     = "Web Security Configuration"
}

variable "hostnames" {
  description = "Names of the selectable hosts to be protected by the configuration. Note that host names are passed as an array; that's what the square brackets surrounding are for. For example [\"www1.example.com\", \"www2.example.com\"]"
  type        = list(string)
}

variable "nl_prefix" {
  description = "The prefix name of netwok lists which will be created (Best practice: same name as configuration_name)"
  type        = string
  default     = "NL"
}

variable "applyReputationControls" {
  description = "Enable Client-Reputation protections"  
  type        = string
  default     = "false"
}
variable "applyBotmanControls" {
  description = "Enable Bot Manager protections" 
  type        = string
  default     = "false"
}

variable "activate" {
  description = "Choose to activate or not your Akamai Security configuration" 
  type        = string
  default     = "false"
}

variable "notification_emails" {
  description = "JSON array of email addresses of people to be notified when activation is complete. To send notification emails to multiple people, separate the individual email addresses by using commas: [\"user1@mail.com\", \"user2@mail.com\"]" 
  type    = list(string)
  default = []
}

variable "note" {
  description = "Information about the configuration and the reason for its activation." 
  type    = string
  default = "Activated by Terraform"
}

variable "network" {
  description = "Name of the network the configuration is being activated for. Allowed values are: STAGING or PRODUCTION" 
  type    = string
  default = "STAGING"
}