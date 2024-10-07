-- Treesitter for nicer syntax-highlighting
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'bash',
        'comment',
        'css',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'json5',
        'lua',
        'php',
        'python',
        'regex',
        'ruby',
        'scss',
        'toml',
        'tsx',
        'typescript',
        'vue',
        'yaml',
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
    }
  end,
}
