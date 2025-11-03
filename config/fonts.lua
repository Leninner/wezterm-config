local wezterm = require('wezterm')
local platform = require('utils.platform')()

local font_name = 'MesloLGS Nerd Font'
local font_size = platform.is_mac and 13.5 or 14

return {
   font = wezterm.font(font_name, {
      weight = 'Regular',
      stretch = 'Normal',
      style = 'Normal',
   }),
   font_size = font_size,
   line_height = 1.05,
   cell_width = 1.0,
   
   harfbuzz_features = {
      'calt=1',
      'clig=1',
      'liga=1',
      'kern=1',
   },
   
   freetype_load_target = 'Light',
   freetype_render_target = 'HorizontalLcd',
   freetype_load_flags = 'NO_HINTING',
   
   warn_about_missing_glyphs = false,
   
   font_rules = {
      {
         intensity = 'Bold',
         italic = true,
         font = wezterm.font(font_name, { weight = 'Bold', style = 'Italic' }),
      },
      {
         intensity = 'Bold',
         font = wezterm.font(font_name, { weight = 'Bold' }),
      },
      {
         italic = true,
         font = wezterm.font(font_name, { style = 'Italic' }),
      },
   },
}
