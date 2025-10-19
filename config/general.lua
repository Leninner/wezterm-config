return {
   -- behaviours
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
   
   set_environment_variables = {
      PATH = '/opt/homebrew/bin:/usr/local/bin:' .. os.getenv('PATH'),
   },

   hyperlink_rules = {
      -- Matches: a URL in parens: (URL)
      {
         regex = '\\((\\w+://\\S+)\\)',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in brackets: [URL]
      {
         regex = '\\[(\\w+://\\S+)\\]',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in curly braces: {URL}
      {
         regex = '\\{(\\w+://\\S+)\\}',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in angle brackets: <URL>
      {
         regex = '<(\\w+://\\S+)>',
         format = '$1',
         highlight = 1,
      },
      -- Then handle URLs not wrapped in brackets
      {
         regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
         format = '$0',
      },
      -- implicit mailto link
      {
         regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
         format = 'mailto:$0',
      },
   },
}
