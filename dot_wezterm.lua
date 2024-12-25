local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'Monaspace Neon'
config.font_size = 16.0

config.color_scheme = 'iceberg-dark'
config.foreground_text_hsb = {
  brightness = 1.5,
}
config.inactive_pane_hsb = {
  saturation = 1.0,
  brightness = 0.5,
}

config.scrollback_lines = 5000

local act = wezterm.action
config.leader = { key = "j", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  { key = '"', mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "%", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
  { key = "[", mods = "LEADER", action = act.ActivateCopyMode }
}
 
config.key_tables = {
  copy_mode = {
  { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
    { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
    { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
    { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
    { key = 'n', mods = 'CTRL', action = act.CopyMode 'PageDown' },
    { key = 'p', mods = 'CTRL', action = act.CopyMode 'PageUp' },
    { key = 'v', mods = 'NONE', action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = 'v', mods = 'CTRL', action = act.CopyMode { SetSelectionMode = 'Block' } },
    { key = 'V', mods = 'NONE', action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = 'V', mods = 'SHIFT', action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = '/', mods = 'NONE', action = act.Search { CaseSensitiveString = '' } },
    { 
      key = 'Escape',
      mods = 'NONE',
      action = act.Multiple {
        { CopyMode = 'ClearPattern' },
        { CopyMode = 'Close' },
      }
    },
    { 
      key = 'q',
      mods = 'NONE',
      action = act.Multiple {
        { CopyMode = 'ClearPattern' },
        { CopyMode = 'Close' },
      }
    },
    {
      key = "y",
      mods = "NONE",
      action = act.Multiple {
        { CopyTo = "Clipboard" },
        { CopyMode = 'ClearPattern' },
        { CopyMode = 'Close' },
      }
    }
  },
  search_mode = {
    { key = 'Enter', mods = 'NONE', action = act.CopyMode 'NextMatch' },
    { key = 'Enter', mods = 'SHIFT', action = act.CopyMode 'PriorMatch' },
    { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
    { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
    {
      key = "[",
      mods = "LEADER",
      action = act.Multiple {
        act.ActivateCopyMode,
        act.CopyMode 'ClearSelectionMode',
      }
    },
    {
      key = 'Escape',
      mods = 'NONE',
      action = act.Multiple {
        act.CopyMode 'ClearPattern',
        act.CopyMode 'Close',
      }
    }
  }
}

return config
