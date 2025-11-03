local wezterm = require('wezterm')
local gpu_adapters = require('utils.gpu_adapter')
local colors = require('colors.custom')
local platform = require('utils.platform')()

return {
   animation_fps = 60,
   max_fps = 144,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',
   webgpu_preferred_adapter = gpu_adapters:pick_best(),
   enable_kitty_graphics = true,
   warn_about_missing_glyphs = false,

   colors = colors,

   background = {
      {
         source = { File = wezterm.GLOBAL.background },
         horizontal_align = 'Center',
         vertical_align = 'Middle',
         attachment = 'Fixed',
         repeat_x = 'NoRepeat',
         repeat_y = 'NoRepeat',
      },
      {
         source = { Color = colors.background },
         height = '100%',
         width = '100%',
         opacity = 0.92,
      },
   },

   enable_scroll_bar = true,
   min_scroll_bar_height = '2cell',

   enable_tab_bar = false,

   window_padding = {
      left = 6,
      right = 6,
      top = 8,
      bottom = 6,
   },
   window_close_confirmation = 'NeverPrompt',
   window_frame = {
      active_titlebar_bg = '#090909',
      inactive_titlebar_bg = '#1a1a1a',
      font = wezterm.font({ family = 'MesloLGS Nerd Font', weight = 'Regular' }),
      font_size = 11.0,
   },
   window_decorations = 'RESIZE',
   
   macos_window_background_blur = 40,
   
   native_macos_fullscreen_mode = true,
   
   inactive_pane_hsb = {
      saturation = 0.85,
      brightness = 0.75,
   },

   default_cursor_style = 'BlinkingBlock',
   cursor_blink_rate = 500,
   cursor_blink_ease_in = 'Constant',
   cursor_blink_ease_out = 'Constant',
   force_reverse_video_cursor = false,

   default_cwd = platform.is_mac and os.getenv('HOME') or nil,

   window_background_opacity = 0.95,
}
