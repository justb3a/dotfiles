return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  -- event = { "BufReadPre", "BufNewFile" },
  event = 'VeryLazy',
  dependencies = { 'windwp/nvim-ts-autotag' },
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  config = function()
    require('nvim-ts-autotag').setup()
  end,
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'comment',
      'css',
      'diff',
      'html',
      'javascript',
      'jsdoc',
      'json',
      'json5',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'regex',
      'scss',
      'tsx',
      'typescript',
      'yaml',
      'vim',
      'vimdoc',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
    context_commentstring = {
      config = {
        javascript = {
          __default = '// %s',
          jsx_element = '{/* %s */}',
          jsx_fragment = '{/* %s */}',
          jsx_attribute = '// %s',
          comment = '// %s',
        },
        typescript = { __default = '// %s', __multiline = '/* %s */' },
      },
    },
  },
}
