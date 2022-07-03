local wezterm = require 'wezterm';
local act = wezterm.action

return {

	-- Window related
	
	window_frame = {
		font_size = 10.0,
	},
	enable_scroll_bar = false,

	-- Tab bar related
	
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
		{ key=",", mods="META", action=act.SplitPane{
			direction="Down",
			size={Percent=50},
		}},
		{ key=".", mods="META", action=act.SplitPane{
			direction="Right",
			size={Percent=50},
		}},
		{ key="Z", mods="META", action=act.TogglePaneZoomState },
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
