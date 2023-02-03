resource "akamai_botman_bot_management_settings" "bot_management_settings" {
  config_id                  = var.config_id
  security_policy_id         = var.security_policy_id
  bot_management_settings    = jsonencode(
    {
     "enableBotManagement": true,
     "enableActiveDetections": true,
     "enableBrowserValidation": true,
     "addAkamaiBotHeader": false,
     "thirdPartyProxyServiceInUse": true,
     "removeBotManagementCookies": true
    }
  )
}