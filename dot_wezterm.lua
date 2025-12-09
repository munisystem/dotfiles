local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font {
  family = 'Monaspace Neon',
  weight = 'Regular',
  harfbuzz_features = { 'calt', 'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08' },
}
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

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(
    wezterm.format {
      { Attribute = { Intensity = 'Bold' } },
      { Text = window:active_workspace() },
    }
  )
end)

local act = wezterm.action
config.leader = { key = "j", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  { key = '"', mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "%", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  { key = "J", mods = "LEADER", action = act.AdjustPaneSize { "Down", 5 } },
  { key = "K", mods = "LEADER", action = act.AdjustPaneSize { "Up", 5 } },
  { key = "L", mods = "LEADER", action = act.AdjustPaneSize { "Left", 5 } },
  { key = "H", mods = "LEADER", action = act.AdjustPaneSize { "Right", 5 } },
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
  { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
  { key = "s", mods = "LEADER", action = act.ShowLauncherArgs { flags = 'WORKSPACES', title = "Select workspace" } },
  {
    key = "e",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for tab' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end)

    }
  },
  {
    key = "S",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            act.SwitchToWorkspace { name = line },
            pane
          )
        end
      end)

    }
  },
  {
    key = "$",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          wezterm.mux.rename_workspace(
            wezterm.mux.get_active_workspace(),
            line
          )
        end
      end)

    }
  },
}

config.key_tables = {
  copy_mode = {
    { key = 'h', mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
    { key = 'j', mods = 'NONE',  action = act.CopyMode 'MoveDown' },
    { key = 'k', mods = 'NONE',  action = act.CopyMode 'MoveUp' },
    { key = 'l', mods = 'NONE',  action = act.CopyMode 'MoveRight' },
    { key = 'n', mods = 'CTRL',  action = act.CopyMode 'PageDown' },
    { key = 'p', mods = 'CTRL',  action = act.CopyMode 'PageUp' },
    { key = '0', mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },
    { key = '$', mods = 'NONE',  action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = '^', mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'w', mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
    { key = 'b', mods = 'NONE',  action = act.CopyMode 'MoveBackwardWord' },
    { key = 'e', mods = 'NONE',  action = act.CopyMode 'MoveForwardWordEnd' },
    { key = 'g', mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackTop' },
    { key = 'G', mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'v', mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = 'v', mods = 'CTRL',  action = act.CopyMode { SetSelectionMode = 'Block' } },
    { key = 'V', mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = 'V', mods = 'SHIFT', action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = '/', mods = 'NONE',  action = act.Search { CaseSensitiveString = '' } },
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
    { key = 'Enter', mods = 'NONE',  action = act.CopyMode 'NextMatch' },
    { key = 'Enter', mods = 'SHIFT', action = act.CopyMode 'PriorMatch' },
    { key = 'n',     mods = 'CTRL',  action = act.CopyMode 'NextMatch' },
    { key = 'p',     mods = 'CTRL',  action = act.CopyMode 'PriorMatch' },
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
