local platform = require('utils.platform')()

local env_vars = {}
if platform.is_mac then
   env_vars = {
      PATH = '/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:' .. (os.getenv('PATH') or ''),
      TERM = 'xterm-256color',
      TERM_PROGRAM = 'WezTerm',
      COLORTERM = 'truecolor',
   }
end

return {
   automatically_reload_config = true,
   exit_behavior = 'CloseOnCleanExit',
   exit_behavior_messaging = 'Verbose',
   status_update_interval = 1000,

   scrollback_lines = 10000,
   enable_csi_u_key_encoding = true,
   
   adjust_window_size_when_changing_font_size = false,
   use_dead_keys = false,
   send_composed_key_when_left_alt_is_pressed = false,
   send_composed_key_when_right_alt_is_pressed = false,
   
   set_environment_variables = env_vars,

   default_prog = platform.is_mac and { '/bin/zsh', '-l' } or nil,
   
   term = 'xterm-256color',
   
   unicode_version = 14,
   allow_square_glyphs_to_overflow_width = 'Never',
   
   enable_wayland = false,

   hyperlink_rules = {
      {
         regex = '\\((\\w+://\\S+)\\)',
         format = '$1',
         highlight = 1,
      },
      {
         regex = '\\[(\\w+://\\S+)\\]',
         format = '$1',
         highlight = 1,
      },
      {
         regex = '\\{(\\w+://\\S+)\\}',
         format = '$1',
         highlight = 1,
      },
      {
         regex = '<(\\w+://\\S+)>',
         format = '$1',
         highlight = 1,
      },
      {
         regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
         format = '$0',
      },
      {
         regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
         format = 'mailto:$0',
      },
      {
         regex = [[\b\w+://[^\s]+]],
         format = '$0',
      },
   },
}
