data:extend({
  {
    type = "string-setting",
    name = "quick-bar-layout-mode",
    setting_type = "runtime-per-user",
    default_value = "two",
    allowed_values = { "two", "three" }
  },
  {
    type = "int-setting",
    name = "quick-bar-anchor-position",
    setting_type = "runtime-per-user",
    default_value = 1,
    minimum_value = 1,
    maximum_value = 4
  }
})
