local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.automatically_reload_config = true
config.color_scheme = "Catppuccin Frappe"
config.font = wezterm.font_with_fallback({ "MonaspiceNe Nerd Font Mono" })
config.font_size = 14.0
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.show_new_tab_button_in_tab_bar = false
config.window_frame = {
	font = wezterm.font("MonaspiceNe Nerd Font Mono"),
	font_size = 14,
}
local color_scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]
config.colors = {
	tab_bar = {
		active_tab = {
			fg_color = color_scheme.brights[4],
			bg_color = color_scheme.background,
		},
		inactive_tab_hover = {
			fg_color = color_scheme.selection_fg,
			bg_color = color_scheme.selection_bg,
		},
	},
}
return config
