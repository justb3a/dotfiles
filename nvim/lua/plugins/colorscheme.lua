-- Consider: https://github.com/catppuccin/nvim
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup()
      vim.cmd.colorscheme 'catppuccin'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPre',
    config = function()
      require('colorizer').setup({
        'css',
        'scss',
        'json',
        'json5',
        'javascript',
      }, { css = true })
    end,
  },
}
