return {
  'dmmulroy/tsc.nvim',
  config = function()
    require('tsc').setup {
      auto_open_qflist = false,
      auto_start_watch_mode = true,
      use_diagnostics = true, -- !!! to display in Error indicator in tree
      enable_progress_notifications = false,
      enable_error_notifications = false,
      flags = {
        watch = true,
      },
    }
  end,
}
