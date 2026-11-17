local wezterm = require('wezterm')
local gpu_adapters = require('utils.gpu_adapter')
local colors = require('colors.custom')
local platform = require('utils.platform')()

return {
   animation_fps = 1,
   max_fps = 60,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',
   webgpu_preferred_adapter = gpu_adapters:pick_best(),
   enable_kitty_graphics = true,
   warn_about_missing_glyphs = false,

   colors = colors,

   enable_scroll_bar = false,
   enable_tab_bar = false,

   window_padding = {
      left = 6,
      right = 6,
      top = 6,
      bottom = 6,
   },
   window_close_confirmation = 'NeverPrompt',
   window_frame = {
      active_titlebar_bg = '#090909',
      inactive_titlebar_bg = '#1a1a1a',
      font = wezterm.font({ family = 'MesloLGS Nerd Font', weight = 'Regular' }),
      font_size = 16.0,
   },
   window_decorations = 'RESIZE',

   native_macos_fullscreen_mode = true,

   inactive_pane_hsb = {
      saturation = 0.85,
      brightness = 0.35,
   },

   default_cursor_style = 'SteadyBlock',
   cursor_blink_rate = 500,
   cursor_blink_ease_in = 'Constant',
   cursor_blink_ease_out = 'Constant',
   force_reverse_video_cursor = false,

   default_cwd = platform.is_mac and os.getenv('HOME') or nil,
}
