local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.automatically_reload_config = true
config.color_scheme = "Catppuccin Frappe"
config.font_size = 14.0
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.show_new_tab_button_in_tab_bar = false

return config
