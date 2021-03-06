local wezterm = require 'wezterm';
local act = wezterm.action

return {

	-- Run PowerShell 7 as default
	-- Uncomment if running on Windows, make sure that PS7 is in PATH
	-- default_prog ={"pwsh.exe"},

	-- QoL
	audible_bell = "Disabled",
	visual_bell =  {
		target = "CursorColor",
		fade_out_duration_ms = 250,
	},

	-- Window related
	
	window_frame = {
		font_size = 10.0,
	},
	enable_scroll_bar = false,

	-- Pane related
	inactive_pane_hsb = {
	    saturation = 0.4,
	    brightness = 0.5,
	},
	pane_focus_follows_mouse = true,

	-- Tab bar related
	-- Overriden by color scheme
	
	colors = {
		tab_bar = {
		}
	},

	-- Font related

	font = wezterm.font_with_fallback({
		"Fantasque Sans Mono",
		"Fira Code",
	}),
	font_size = 12.0,
	bold_brightens_ansi_colors = true,

	-- Pretty colors

	color_scheme = "Gruvbox Dark",

	-- Keybinds

	leader = { key="Space", mods="SHIFT", timeout_milliseconds=500 },
	keys = {

		-- Tab operations, mostly behind leader
		{ key="L", mods="LEADER", action=act.ShowLauncher},
		{ key="C", mods="LEADER", action=act.SpawnTab("CurrentPaneDomain")},
		{ key="N", mods="LEADER", action=act.ActivateTabRelative(1)},

		-- Pane operations, mostly behind meta
		{ key="W", mods="LEADER", action=act.CloseCurrentPane{confirm=false}},
		{ key="Z", mods="LEADER", action=act.TogglePaneZoomState },
		{ key=",", mods="META", action=act.SplitPane{
			direction="Down",
			size={Percent=50},
		}},
		{ key=".", mods="META", action=act.SplitPane{
			direction="Right",
			size={Percent=50},
		}},
		{ key = "LeftArrow", mods="META",
			action=act.ActivatePaneDirection("Left")},
		{ key = "RightArrow", mods="META",
		  	action=act.ActivatePaneDirection("Right")},
    		{ key = "UpArrow", mods="META",
			action=act.ActivatePaneDirection("Up")},
		{ key = "DownArrow", mods="META",
		  action=act.ActivatePaneDirection("Down")},
	},
}
