local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.initial_cols = 170
config.initial_rows = 40

-- I have tmux configued to use CTRL+a but that wasn't working well with MacOS
-- I map CMD+a to the CTRL+a so things like resizing the window continue to work
local TMUX_LEADER = {
	key = 'a',
	mods = 'CTRL'
}

-- Using CMD+b as the leader key for Wezterm
config.leader = { key = 'b', mods = 'CMD' , timeout_milliseconds = 1000}

config.keys = {
	{ -- Allows CMD+a to act as leader for tmux
		key = 'a',
		mods = 'CMD',
		action = act.SendKey(TMUX_LEADER),
	},
	{ -- Switches into resize_pane mode for tmux
		key = 'r',
		mods = 'LEADER',
		action = act.ActivateKeyTable {
			name = 'resize_pane',
			one_shot = false,
		},
	},
}

-- If I want to resize a pane in tmux, I need Ctrl + Some arrow key
-- Unfortunately, that's an action on MacOS that moves to another open window
config.key_tables = {
	resize_pane  = {
		{ -- Use escape to exit the resize-pane mode
			key = 'Escape',
			action = 'PopKeyTable'
		},
		{
			key = 'LeftArrow',
			action = act.Multiple {
				act.SendKey(TMUX_LEADER),
				act.SendKey { key = 'LeftArrow', mods = 'CTRL' }
			}
		},
		{
			key = 'RightArrow',
			action = act.Multiple {
				act.SendKey(TMUX_LEADER),
				act.SendKey { key = 'RightArrow', mods = 'CTRL' }
			}
		},
		{
			key = 'UpArrow',
			action = act.Multiple {
				act.SendKey(TMUX_LEADER),
				act.SendKey { key = 'UpArrow', mods = 'CTRL' }
			}
		},
		{
			key = 'DownArrow',
			action = act.Multiple {
				act.SendKey(TMUX_LEADER),
				act.SendKey { key = 'DownArrow', mods = 'CTRL' }
			}
		}
	}
}

return config
