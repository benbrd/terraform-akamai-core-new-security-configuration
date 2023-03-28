# resource to set how Akamai handles the Akamai Pragma Header.
resource "random_string" "secret_header" {
  length           = 20
  lower            = true
  upper            = true
  numeric          = true
  special          = true
  override_special = "-"
  min_special      = "1"
}

resource "akamai_appsec_advanced_settings_pragma_header" "pragma_header" {
  depends_on = [akamai_appsec_security_policy.security_policy, random_string.secret_header]
  config_id = akamai_appsec_configuration.akamai_appsec.config_id
  pragma_header = jsonencode(
    {
      "action": "REMOVE",
      "conditionOperator": "OR",
      "excludeCondition": [
          {
              "type": "requestHeaderValueMatch",
              "positiveMatch": true,
              "header": "X-Akamai-Debug-Pragma",
              "value": [
                  "${random_string.secret_header.result}"
              ],
              "name" : "",                      
              "valueCase": true,
              "valueWildcard": false,
              "useHeaders" : false
          },
          {
              "type": "networkList"
              "positiveMatch": true,
              "value": [
                "${var.pragmabypass_list_id}"
              ],
              "name" : "",              
              "valueCase" : false,
              "valueWildcard" : false,
              "useHeaders" : false    
          }
        ],
      //"override": true
    }
 )
}

resource "akamai_appsec_advanced_settings_evasive_path_match" "evasive_path_match" {
  config_id         = akamai_appsec_configuration.akamai_appsec.config_id
  enable_path_match = true
}

resource "akamai_appsec_advanced_settings_logging" "logging" {
  config_id = akamai_appsec_configuration.akamai_appsec.config_id
  logging = jsonencode(
    {
      "allowSampling" : true,
      "cookies" : {
        "type" : "all"
      },
      "customHeaders" : {
        "type" : "all"
      },
      "standardHeaders" : {
        "type" : "all"
      }
    }
  )
}