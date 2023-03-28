resource "akamai_appsec_reputation_profile" "dos_attackers_high_threat" {
  config_id 			      = var.config_id
  reputation_profile  	= jsonencode(
    {
      "context" : "DOSATCK",
      "name" : "DoS Attackers (High Threat) [Non-Shared IPs]",
      "sharedIpHandling" : "NON_SHARED",
      "threshold" : 9
    }
  )
}

resource "akamai_appsec_reputation_profile" "dos_attackers_high_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_profile.dos_attackers_high_threat]
  config_id 			      = var.config_id
  reputation_profile 	  = jsonencode(
    {
      "context" : "DOSATCK",
      "name" : "DoS Attackers (High Threat) [Shared IPs]",
      "sharedIpHandling" : "SHARED_ONLY",
      "threshold" : 9
    }
  )
}

resource "akamai_appsec_reputation_profile" "dos_attackers_low_threat" {
  depends_on      		  = [akamai_appsec_reputation_profile.dos_attackers_high_threat_shared]
  config_id 			      = var.config_id  
  reputation_profile 	  = jsonencode(
    {
      "context" : "DOSATCK",
      "name" : "DoS Attackers (Low Threat) [Non-Shared IPs]",
      "sharedIpHandling" : "NON_SHARED",
      "threshold" : 5
    }
  )
}

resource "akamai_appsec_reputation_profile" "dos_attackers_low_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_profile.dos_attackers_low_threat]
  config_id 			      = var.config_id  
  reputation_profile 	  = jsonencode(
    {
      "context" : "DOSATCK",
      "name" : "DoS Attackers (Low Threat) [Shared IPs]",
      "sharedIpHandling" : "SHARED_ONLY",
      "threshold" : 7
    }
  )
}


resource "akamai_appsec_reputation_profile" "scanning_tools_high_threat" {
  depends_on      		  = [akamai_appsec_reputation_profile.dos_attackers_low_threat_shared]
  config_id 			      = var.config_id  
  reputation_profile 	  = jsonencode(
    {
      "context" : "SCANTL",
      "name" : "Scanning Tools (High Threat) [Non-Shared IPs]",
      "sharedIpHandling" : "NON_SHARED",
      "threshold" : 9
    }
  )
}

resource "akamai_appsec_reputation_profile" "scanning_tools_high_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_profile.scanning_tools_high_threat]
  config_id 			      = var.config_id  
  reputation_profile 	  = jsonencode(
    {
      "context" : "SCANTL",
      "name" : "Scanning Tools (High Threat) [Shared IPs]",
      "sharedIpHandling" : "SHARED_ONLY",
      "threshold" : 9
    }
  )
}

resource "akamai_appsec_reputation_profile" "scanning_tools_low_threat" {
  depends_on      		  = [akamai_appsec_reputation_profile.scanning_tools_high_threat_shared]
  config_id 			      = var.config_id  
  reputation_profile 	  = jsonencode(
    {
      "context" : "SCANTL",
      "name" : "Scanning Tools (Low Threat) [Non-Shared IPs]",
      "sharedIpHandling" : "NON_SHARED",
      "threshold" : 5
    }
  )
}

resource "akamai_appsec_reputation_profile" "scanning_tools_low_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_profile.scanning_tools_low_threat]
  config_id 			      = var.config_id  
  reputation_profile 	  = jsonencode(
    {
      "context" : "SCANTL",
      "name" : "Scanning Tools (Low Threat) [Shared IPs]",
      "sharedIpHandling" : "SHARED_ONLY",
      "threshold" : 7
    }
  )
}


resource "akamai_appsec_reputation_profile" "web_attackers_high_threat" {
  depends_on      		  = [akamai_appsec_reputation_profile.scanning_tools_low_threat_shared]
  config_id 			      = var.config_id  
  reputation_profile 	  = jsonencode(
    {
      "context" : "WEBATCK",
      "name" : "Web Attackers (High Threat) [Non-Shared IPs]",
      "sharedIpHandling" : "NON_SHARED",
      "threshold" : 9
    }
  )
}

resource "akamai_appsec_reputation_profile" "web_attackers_high_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_profile.web_attackers_high_threat]
  config_id 			      = var.config_id  
  reputation_profile 	  = jsonencode(
    {
      "context" : "WEBATCK",
      "name" : "Web Attackers (High Threat) [Shared IPs]",
      "sharedIpHandling" : "SHARED_ONLY",
      "threshold" : 9
    }
  )
}

resource "akamai_appsec_reputation_profile" "web_attackers_low_threat" {
  depends_on      		  = [akamai_appsec_reputation_profile.web_attackers_high_threat_shared]
  config_id 			      = var.config_id  
  reputation_profile 	  = jsonencode(
    {
      "context" : "WEBATCK",
      "name" : "Web Attackers (Low Threat) [Non-Shared IPs]",
      "sharedIpHandling" : "NON_SHARED",
      "threshold" : 5
    }
  )
}

resource "akamai_appsec_reputation_profile" "web_attackers_low_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_profile.web_attackers_low_threat]
  config_id 			      = var.config_id  
  reputation_profile 	  = jsonencode(
    {
      "context" : "WEBATCK",
      "name" : "Web Attackers (Low Threat) [Shared IPs]",
      "sharedIpHandling" : "SHARED_ONLY",
      "threshold" : 7
    }
  )
}

resource "akamai_appsec_reputation_profile" "web_scrapers_high_threat" {
  depends_on      		  = [akamai_appsec_reputation_profile.web_attackers_low_threat_shared]
  config_id 			      = var.config_id  
  reputation_profile 	  = jsonencode(
    {
      "context" : "WEBSCRP",
      "name" : "Web Scrapers (High Threat) [Non-Shared IPs]",
      "sharedIpHandling" : "NON_SHARED",
      "threshold" : 9
    }
  )
}

resource "akamai_appsec_reputation_profile" "web_scrapers_high_threat_shared" {
  depends_on      		  = [akamai_appsec_reputation_profile.web_scrapers_high_threat]
  config_id 			      = var.config_id  
  reputation_profile 	  = jsonencode(
    {
      "context" : "WEBSCRP",
      "name" : "Web Scrapers (High Threat) [Shared IPs]",
      "sharedIpHandling" : "SHARED_ONLY",
      "threshold" : 9
    }
  )
}

resource "akamai_appsec_reputation_profile" "web_scrapers_low_threat" {
  depends_on      		  = [akamai_appsec_reputation_profile.web_scrapers_high_threat_shared]
  config_id 			      = var.config_id  
  reputation_profile 	  = jsonencode(
    {
      "context" : "WEBSCRP",
      "name" : "Web Scrapers (Low Threat) [Non-Shared IPs]",
      "sharedIpHandling" : "NON_SHARED",
      "threshold" : 5
    }
  )
}

resource "akamai_appsec_reputation_profile" "web_scrapers_low_threat_shared" {
  depends_on        		= [akamai_appsec_reputation_profile.web_scrapers_low_threat]
  config_id 	      		= var.config_id  
  reputation_profile   	= jsonencode(
    {
      "context" : "WEBSCRP",
      "name" : "Web Scrapers (Low Threat) [Shared IPs]",
      "sharedIpHandling" : "SHARED_ONLY",
      "threshold" : 7
    }
  )
}