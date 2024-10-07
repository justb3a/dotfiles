-- nice status line
return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    { 'kyazdani42/nvim-web-devicons', opt = true },
  },
  event = 'VimEnter',
  config = function()
    require('lualine').setup {
      options = {
        theme = 'gruvbox',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
