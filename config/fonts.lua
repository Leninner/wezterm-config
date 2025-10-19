local wezterm = require('wezterm')
local platform = require('utils.platform')

local font = 'MesloLGS Nerd Font Mono'
local font_size = platform().is_mac and 14 or 14

return {
   font = wezterm.font(font, { weight = 'Regular' }),
   font_size = font_size,
   line_height = 1.0,
   cell_width = 1.0,
   
   freetype_load_target = 'Normal',
   freetype_render_target = 'Normal',
}
