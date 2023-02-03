resource "akamai_appsec_reputation_profile_action" "dos_attackers_high_threat_action" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.dos_attackers_high_threat]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.dos_attackers_high_threat.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "dos_attackers_high_threat_shared_action" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.dos_attackers_high_threat_shared]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.dos_attackers_high_threat_shared.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "dos_attackers_low_threat" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.dos_attackers_low_threat]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.dos_attackers_low_threat.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "dos_attackers_low_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.dos_attackers_low_threat_shared]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.dos_attackers_low_threat_shared.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "scanning_tools_high_threat" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.scanning_tools_high_threat]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.scanning_tools_high_threat.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "scanning_tools_high_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.scanning_tools_high_threat_shared]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.scanning_tools_high_threat_shared.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "scanning_tools_low_threat" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.scanning_tools_low_threat]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.scanning_tools_low_threat.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "scanning_tools_low_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.scanning_tools_low_threat_shared]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.scanning_tools_low_threat_shared.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "web_attackers_high_threat" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.web_attackers_high_threat]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_attackers_high_threat.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "web_attackers_high_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.web_attackers_high_threat_shared]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_attackers_high_threat_shared.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "web_attackers_low_threat" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.web_attackers_low_threat]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_attackers_low_threat.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "web_attackers_low_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.web_attackers_low_threat_shared]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_attackers_low_threat_shared.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "web_scrapers_high_threat" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.web_scrapers_high_threat]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_scrapers_high_threat.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "web_scrapers_high_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.web_scrapers_high_threat_shared]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_scrapers_high_threat_shared.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "web_scrapers_low_threat" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.web_scrapers_low_threat]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_scrapers_low_threat.reputation_profile_id
  action                = "alert"
}

resource "akamai_appsec_reputation_profile_action" "web_scrapers_low_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_protection.reputation_protection, akamai_appsec_reputation_profile.web_scrapers_low_threat_shared]
  config_id             = var.config_id
  security_policy_id    = var.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_scrapers_low_threat_shared.reputation_profile_id
  action                = "alert"
}