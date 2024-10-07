-- colorizer for nice css-colors
return {
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
}
