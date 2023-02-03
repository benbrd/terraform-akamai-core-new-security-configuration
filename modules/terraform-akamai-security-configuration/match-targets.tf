resource "akamai_appsec_match_target" "match_target" {
  depends_on    = [akamai_appsec_security_policy.security_policy]
  config_id     = akamai_appsec_configuration.akamai_appsec.config_id  
  match_target  = jsonencode(
    {
      "defaultFile": "NO_MATCH",
      "filePaths": [
        "/failover/*"
      ],
      "isNegativeFileExtensionMatch": false,
      "isNegativePathMatch": true,     
      "bypassNetworkLists": [
        {
          "id": "16656_CPISERVERS"
        },
        {
          "id": "14121_IMAGEMANAGERSERVERS"
        },
        {
          "id": "${var.securitybypass_list_id}"
        }
      ],
      "configId": "${akamai_appsec_configuration.akamai_appsec.config_id}",
      "securityPolicy": {
        "policyId": "${akamai_appsec_security_policy.security_policy.security_policy_id}"
      },
      "type": "website",
    }
  )
}