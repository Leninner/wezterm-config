local w = require('wezterm')

local function is_vim(pane)
   local vars = pane:get_user_vars()
   return vars.IS_NVIM == 'true'
end

local function get_vim_mode(pane)
   local vars = pane:get_user_vars()
   return vars.VIM_MODE
end

local direction_keys = {
   Left = 'h',
   Down = 'j',
   Up = 'k',
   Right = 'l',
   h = 'Left',
   j = 'Down',
   k = 'Up',
   l = 'Right',
}

local function split_nav(resize_or_move, key)
   return {
      key = key,
      mods = resize_or_move == 'resize' and 'META' or 'CTRL',
      action = w.action_callback(function(win, pane)
         if is_vim(pane) then
            win:perform_action({
               SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
            }, pane)
         else
            if resize_or_move == 'resize' then
               win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
            else
               win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
            end
         end
      end),
   }
end

local last_mode = {}
local function apply_cursor_style(window, pane)
   local pane_id = pane:pane_id()
   if not is_vim(pane) then
      if last_mode[pane_id] ~= 'none' then
         window:perform_action({ SetCursorStyle = 'BlinkingBlock' }, pane)
         last_mode[pane_id] = 'none'
      end
      return
   end

   local mode = get_vim_mode(pane)
   if not mode or last_mode[pane_id] == mode then
      return
   end

   local cursor_style = 'BlinkingBlock'
   if mode == 'i' or mode == 'insert' then
      cursor_style = 'BlinkingBar'
   elseif mode == 'R' or mode == 'replace' then
      cursor_style = 'SteadyBar'
   elseif mode == 'c' or mode == 'command' then
      cursor_style = 'SteadyBlock'
   end

   window:perform_action({ SetCursorStyle = cursor_style }, pane)
   last_mode[pane_id] = mode
end

w.on('update-status', function(window, pane)
   apply_cursor_style(window, pane)
end)

return {
   keys = {
      split_nav('move', 'h'),
      split_nav('move', 'j'),
      split_nav('move', 'k'),
      split_nav('move', 'l'),
      split_nav('resize', 'h'),
      split_nav('resize', 'j'),
      split_nav('resize', 'k'),
      split_nav('resize', 'l'),
   },
}
