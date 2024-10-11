-- Highlight, edit, and navigate code
local Treesitter = require 'utils.treesitter'

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = Treesitter.ensure_installed,
      auto_install = true, -- Autoinstall languages that are not installed
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = false },
      context_commentstring = Treesitter.context_commentstring,
    },
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
}
