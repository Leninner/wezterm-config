local wezterm = require('wezterm')
local platform = require('utils.platform')()
local backdrops = require('utils.backdrops')
local act = wezterm.action

local mod = {}

if platform.is_mac then
   mod.SUPER = 'SUPER'
   mod.SUPER_REV = 'SUPER|CTRL'
elseif platform.is_win or platform.is_linux then
   mod.SUPER = 'CTRL' -- to not conflict with Windows key shortcuts
   mod.SUPER_REV = 'CTRL|ALT'
end

-- stylua: ignore
local keys = {
   -- misc/useful --
   { key = '1', mods = mod.SUPER, action = 'ActivateCopyMode' },
   { key = '2', mods = mod.SUPER, action = act.ActivateCommandPalette },
   { key = '3', mods = mod.SUPER, action = act.ShowLauncher },
   { key = '4', mods = mod.SUPER, action = act.ShowLauncherArgs({ flags = 'FUZZY|TABS' }) },
   {
      key = '5',
      mods = mod.SUPER,
      action = act.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }),
   },

   -- window controls --
   { key = 'F11', mods = 'NONE',    action = act.ToggleFullScreen },
   { key = 'F12', mods = 'NONE',    action = act.ShowDebugOverlay },
   { key = 'f',   mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = '' }) },
   
   -- cursor movement --
   { key = 'LeftArrow',  mods = mod.SUPER,     action = act.SendString '\x1bOH' },
   { key = 'RightArrow', mods = mod.SUPER,     action = act.SendString '\x1bOF' },
   { key = 'Backspace',  mods = mod.SUPER, action = act.SendString '\x15' },
   
   -- Option+Arrow for word-by-word movement (shell and nvim terminal)
   { key = 'h',  mods = 'OPT', action = act.SendString '\x1bb' },
   { key = 'l',  mods = 'OPT', action = act.SendString '\x1bf' },

   -- copy/paste --
   { key = 'c',          mods = 'CTRL|SHIFT',  action = act.CopyTo('Clipboard') },
   { key = 'v',          mods = 'CTRL|SHIFT',  action = act.PasteFrom('Clipboard') },
   { key = 'c',          mods = mod.SUPER,     action = act.CopyTo('Clipboard') },
   { key = 'v',          mods = mod.SUPER,     action = act.PasteFrom('Clipboard') },

   -- tabs --
   -- tabs: spawn+close
   { key = 't',          mods = mod.SUPER,     action = act.SpawnTab('DefaultDomain') },
   { key = 't',          mods = mod.SUPER_REV, action = act.SpawnTab({ DomainName = 'Wezterm Ubuntu' }) },
   { key = 'w',          mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = false }) },

   -- tabs: navigation
   { key = '[',          mods = mod.SUPER,     action = act.ActivateTabRelative(-1) },
   { key = ']',          mods = mod.SUPER,     action = act.ActivateTabRelative(1) },
   { key = '[',          mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
   { key = ']',          mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

   -- window --
   -- spawn windows
   { key = 'n',          mods = mod.SUPER,     action = act.SpawnWindow },
   { key = 'q',          mods = mod.SUPER,     action = act.QuitApplication },

   -- background controls --
   {
      key = [[/]],
      mods = mod.SUPER,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:random(window)
      end),
   },
   {
      key = [[,]],
      mods = mod.SUPER,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:cycle_back(window)
      end),
   },
   {
      key = [[.]],
      mods = mod.SUPER,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:cycle_forward(window)
      end),
   },
   {
      key = [[/]],
      mods = mod.SUPER_REV,
      action = act.InputSelector({
         title = 'Select Background',
         choices = backdrops:choices(),
         fuzzy = true,
         fuzzy_description = 'Select Background: ',
         action = wezterm.action_callback(function(window, _pane, idx)
            ---@diagnostic disable-next-line: param-type-mismatch
            backdrops:set_img(window, tonumber(idx))
         end),
      }),
   },

   -- panes --
   -- panes: split panes
   {
      key = [[\]],
      mods = mod.SUPER,
      action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
   },
   {
      key = [[\]],
      mods = mod.SUPER_REV,
      action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
   },

   -- panes: zoom+close pane
   { key = 'Enter', mods = mod.SUPER,     action = act.TogglePaneZoomState },
   { key = 'w',     mods = mod.SUPER,     action = act.CloseCurrentPane({ confirm = false }) },

   -- panes: navigation
   { key = 'k',     mods = mod.SUPER, action = act.ActivatePaneDirection('Up') },
   { key = 'j',     mods = mod.SUPER, action = act.ActivatePaneDirection('Down') },
   { key = 'h',     mods = mod.SUPER, action = act.ActivatePaneDirection('Left') },
   { key = 'l',     mods = mod.SUPER, action = act.ActivatePaneDirection('Right') },
   {
      key = 'p',
      mods = mod.SUPER_REV,
      action = act.PaneSelect({ alphabet = '1234567890', mode = 'SwapWithActiveKeepFocus' }),
   },

   -- key-tables --
   -- resizes fonts
   {
      key = 'f',
      mods = platform.is_mac and 'SUPER|ALT' or 'SUPER',
      action = act.ActivateKeyTable({
         name = 'resize_font',
         one_shot = false,
         timeout_milliseconds = 1000,
      }),
   },
   -- resize panes
   {
      key = 'r',
      mods = platform.is_mac and 'SUPER' or 'SUPER|ALT',
      action = act.ActivateKeyTable({
         name = 'resize_pane',
         one_shot = false,
         timeout_milliseconds = 1000,
      }),
   },
}

-- stylua: ignore
local key_tables = {
   resize_font = {
      { key = 'k',      action = act.IncreaseFontSize },
      { key = 'j',      action = act.DecreaseFontSize },
      { key = 'r',      action = act.ResetFontSize },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q',      action = 'PopKeyTable' },
   },
   resize_pane = {
      { key = 'k',      action = act.AdjustPaneSize({ 'Up', 5 }) },
      { key = 'j',      action = act.AdjustPaneSize({ 'Down', 5 }) },
      { key = 'h',      action = act.AdjustPaneSize({ 'Left', 5 }) },
      { key = 'l',      action = act.AdjustPaneSize({ 'Right', 5 }) },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q',      action = 'PopKeyTable' },
   },
}

local mouse_bindings = {
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
   },
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CMD',
      action = act.OpenLinkAtMouseCursor,
   },
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'SUPER',
      action = act.OpenLinkAtMouseCursor,
   },
}

if platform.is_mac then
   table.insert(mouse_bindings, {
      event = { Down = { streak = 3, button = 'Left' } },
      mods = 'NONE',
      action = act.SelectTextAtMouseCursor('SemanticZone'),
   })
   table.insert(mouse_bindings, {
      event = { Drag = { streak = 1, button = 'Left' } },
      mods = 'ALT',
      action = act.StartWindowDrag,
   })
end

local config = {
   disable_default_key_bindings = true,
   leader = platform.is_mac and { key = 'Space', mods = 'SUPER|ALT' } or { key = 'Space', mods = mod.SUPER_REV },
   keys = keys,
   key_tables = key_tables,
   mouse_bindings = mouse_bindings,
}

if platform.is_mac then
   config.canonicalize_pasted_newlines = 'LineFeed'
end

return config
