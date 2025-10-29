return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        -- see themes: https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        theme = 'papercolor_dark',
        --theme = 'codedark',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
        lualine_x = {
          {
            -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages
            require('noice').api.statusline.mode.get,
            cond = require('noice').api.statusline.mode.has,
            color = { fg = '#ff9e64' },
          },
          'encoding',
          'fileformat',
          'filetype',
        },
      },
    }
  end,
}
