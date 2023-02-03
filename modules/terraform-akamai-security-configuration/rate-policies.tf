// Create and Configure Rate Policies

resource "akamai_appsec_rate_policy" "rate_policy_page_view_requests" {
  depends_on  = [akamai_appsec_security_policy.security_policy]
  config_id   = akamai_appsec_configuration.akamai_appsec.config_id
  rate_policy = jsonencode(
    {
         "additionalMatchOptions": [
              {
                   "positiveMatch": false,
                   "type": "NetworkListCondition",
                   "values": [
                        "${var.rcbypass_list_id}"
                   ]
              },
              {
                   "positiveMatch": false,
                   "type": "RequestMethodCondition",                   
                   "values": [
                        "POST",
                        "PUT"
                   ]
              }
              
         ],
         "fileExtensions": {
              "values": [
              "aif",
              "aiff",
              "au",
              "avi",
              "bin",
              "bmp",
              "cab",
              "carb",
              "cct",
              "cdf",
              "class",
              "css",
              "doc",
              "dcr",
              "dtd",
              "exe",
              "flv",
              "gcf",
              "gff",
              "gif",
              "grv",
              "hdml",
              "hqx",
              "ico",
              "ini",
              "jpeg",
              "jpg",
              "js",
              "mov",
              "mp3",
              "nc",
              "pct",
              "pdf",
              "png",
              "ppc",
              "pws",
              "svg",
              "swa",
              "swf",
              "txt",
              "vbs",
              "w32",
              "wav",
              "wbmp",
              "wml",
              "wmlc",
              "wmls",
              "wmlsc",
              "xsd",
              "zip",
              "webp",
              "jxr",
              "hdp",
              "wdp",
              "webm",
              "ogv",
              "mp4",
              "ttf",
              "woff",
              "eot",
              "woff2"
              ],
              "positiveMatch": false
         },
         "matchType": "path",
         "type": "WAF",
         "name": "Page View Requests",
         "description": "A popular brute force attack consists of sending a large number of requests for base page HTML page or XHR requests (usually non-cacheable). This could destabilize the origin.",
         "averageThreshold": 12,
         "burstThreshold": 18,
         "clientIdentifier": "ip",
         "useXForwardForHeaders": false,
         "requestType": "ClientRequest",
         "sameActionOnIpv6": true,
         "pathMatchType": "Custom",
         "pathUriPositiveMatch": true
    }
  )
}

resource "time_sleep" "wait1" {
  depends_on      = [akamai_appsec_rate_policy.rate_policy_page_view_requests]
  create_duration = "5s"
}

resource "akamai_appsec_rate_policy" "rate_policy_origin_error" {
  depends_on = [time_sleep.wait1]
  config_id  = akamai_appsec_configuration.akamai_appsec.config_id
  rate_policy = jsonencode(
    {
        "name": "Origin Errors",
        "matchType": "path",
        "clientIdentifier": "ip",
        "averageThreshold": 5,
        "burstThreshold": 8,
        "description": "An excessive error rate from the origin could indicate malicious activity by a bot scanning the site or a publishing error. In both cases, this would increase the origin traffic and could potentially destabilize it.",
        "pathMatchType": "Custom",
        "pathUriPositiveMatch": true,
        "requestType": "ForwardResponse",
        "sameActionOnIpv6": true,
        "type": "WAF",
        "useXForwardForHeaders": false,
        "additionalMatchOptions": [
          {
               "positiveMatch" : false,
               "type" : "NetworkListCondition",
               "values" : [
                    "${var.rcbypass_list_id}"
               ]
          },
          {
                "positiveMatch": true,
                "type": "ResponseStatusCondition",
                "values": [
                    "400",
                    "401",
                    "402",
                    "403",
                    "404",
                    "405",
                    "406",
                    "407",
                    "408",
                    "409",
                    "410",
                    "429",
                    "500",
                    "501",
                    "502",
                    "503",
                    "504"
                ]
          }
        ]
    }
  )
}

resource "time_sleep" "wait2" {
  depends_on      = [akamai_appsec_rate_policy.rate_policy_origin_error]
  create_duration = "5s"
}

resource "akamai_appsec_rate_policy" "rate_policy_post_requests" {
  depends_on = [time_sleep.wait2]
  config_id  = akamai_appsec_configuration.akamai_appsec.config_id
  rate_policy = jsonencode(
    {
        "name": "POST or PUT Requests",
        "matchType": "path",
        "description": "Mitigating HTTP flood attacks using POST or PUT requests",
        "averageThreshold": 3,
        "burstThreshold": 5,
        "clientIdentifier": "ip",
        "pathMatchType": "Custom",
        "pathUriPositiveMatch": true,
        "requestType": "ClientRequest",
        "sameActionOnIpv6": true,
        "type": "WAF",
        "useXForwardForHeaders": false,
        "additionalMatchOptions": [
          {
               "positiveMatch" : false,
               "type" : "NetworkListCondition",
               "values" : [
                    "${var.rcbypass_list_id}"
               ]
          },            
          {
                "positiveMatch": true,
                "type": "RequestMethodCondition",
                "values": [
                    "POST",
                    "PUT"
                ]
          }
        ]
    }
  )
}



resource "time_sleep" "wait3" {
  depends_on      = [akamai_appsec_rate_policy.rate_policy_post_requests]
  create_duration = "5s"
}


resource "akamai_appsec_rate_policy" "rate_policy_forward_requests" {
  depends_on = [time_sleep.wait3]
  config_id  = akamai_appsec_configuration.akamai_appsec.config_id
  rate_policy = jsonencode(
    {
          "additionalMatchOptions" : [
          {
               "positiveMatch" : false,
               "type" : "NetworkListCondition",
               "values" : [
                    "${var.rcbypass_list_id}"
               ]
          },
          {
               "positiveMatch" : false,
               "type" : "RequestMethodCondition",
               "values" : [
                    "POST",
                    "PUT"
               ]
          }
          ],
         "matchType": "path",
         "type": "WAF",
         "name": "Forward Requests",
         "description": "Identify requests forwarded to origin. This allows visibility in the origin traffic and catches requests that should be cached but are not (e.g. due to delivery misconfiguration).",
         "averageThreshold": 12,
         "burstThreshold": 18,
         "clientIdentifier": "ip",
         "useXForwardForHeaders": false,
         "requestType": "ForwardRequest",
         "sameActionOnIpv6": true,
         "pathMatchType": "Custom",
         "pathUriPositiveMatch": true
    }
  )
}


resource "time_sleep" "wait4" {
  depends_on      = [akamai_appsec_rate_policy.rate_policy_forward_requests]
  create_duration = "5s"
}

resource "akamai_appsec_rate_policy" "rate_policy_sensitive_resources" {
  depends_on = [time_sleep.wait4]
  config_id  = akamai_appsec_configuration.akamai_appsec.config_id
  rate_policy = jsonencode(
    {
        "name": "Sensitive Resources",
        "matchType": "path",
        "description": "Protection against brute force attacks on sensitive resources such as login or reset password page.",
        "averageThreshold": 2,
        "burstThreshold": 3,
        "clientIdentifier": "ip",
        "pathMatchType": "Custom",
        "pathUriPositiveMatch": true,
        "requestType": "ClientRequest",
        "sameActionOnIpv6": true,
        "type": "WAF",
        "useXForwardForHeaders": false,
        "path": {
              "values": [
                   "/login/",
                   "/login"
              ],
              "positiveMatch": true
         },
        "additionalMatchOptions": [
          {
               "positiveMatch" : false,
               "type" : "NetworkListCondition",
               "values" : [
                    "${var.rcbypass_list_id}"
               ]
          }
        ]
    }
  )
}