resource "akamai_botman_custom_bot_category" "custom_bot_category_1" {
  depends_on      		= [akamai_botman_bot_management_settings.bot_management_settings]
  config_id           = var.config_id
  custom_bot_category = jsonencode(
    {
      "categoryName": "${var.name} Networks"
    }
  )
}

resource "akamai_botman_custom_bot_category_action" "custom_category_action_1" {
  depends_on      		       = [akamai_botman_custom_bot_category.custom_bot_category_1]
  config_id                  = var.config_id
  security_policy_id         = var.security_policy_id
  category_id                = akamai_botman_custom_bot_category.custom_bot_category_1.category_id
  custom_bot_category_action = jsonencode(
    {
      "action": "ignore"
    }
  )
}

resource "akamai_botman_custom_bot_category" "custom_bot_category_2" {
  depends_on      		= [akamai_botman_bot_management_settings.bot_management_settings, akamai_botman_custom_bot_category.custom_bot_category_1]
  config_id           = var.config_id
  custom_bot_category = jsonencode(
    {
      "categoryName": "${var.name} Bots"
    }
  )
}

resource "akamai_botman_custom_bot_category_action" "custom_category_action_2" {
  depends_on      		       = [akamai_botman_custom_bot_category.custom_bot_category_2]
  config_id                  = var.config_id
  security_policy_id         = var.security_policy_id
  category_id                = akamai_botman_custom_bot_category.custom_bot_category_2.category_id
  custom_bot_category_action = jsonencode(
    {
      "action": "allow"
    }
  )
}

resource "akamai_botman_custom_bot_category" "custom_bot_category_3" {
  depends_on      		= [akamai_botman_bot_management_settings.bot_management_settings, akamai_botman_custom_bot_category.custom_bot_category_2]
  config_id           = var.config_id
  custom_bot_category = jsonencode(
    {
      "categoryName": "${var.name} Partners"
    }
  )
}

resource "akamai_botman_custom_bot_category_action" "custom_category_action_3" {
  depends_on      		       = [akamai_botman_custom_bot_category.custom_bot_category_3]
  config_id                  = var.config_id
  security_policy_id         = var.security_policy_id
  category_id                = akamai_botman_custom_bot_category.custom_bot_category_3.category_id
  custom_bot_category_action = jsonencode(
    {
      "action": "monitor"
    }
  )
}

resource "akamai_botman_custom_bot_category" "custom_bot_category_4" {
  depends_on      		= [akamai_botman_bot_management_settings.bot_management_settings, akamai_botman_custom_bot_category.custom_bot_category_3]
  config_id           = var.config_id
  custom_bot_category = jsonencode(
    {
      "categoryName": "Known Bad Bots"
    }
  )
}

resource "akamai_botman_custom_bot_category_action" "custom_category_action_4" {
  depends_on      		       = [akamai_botman_custom_bot_category.custom_bot_category_4]
  config_id                  = var.config_id
  security_policy_id         = var.security_policy_id
  category_id                = akamai_botman_custom_bot_category.custom_bot_category_4.category_id
  custom_bot_category_action = jsonencode(
    {
      "action": "tarpit"
    }
  )
}