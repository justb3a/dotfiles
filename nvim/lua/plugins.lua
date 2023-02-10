local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

function get_config(name)
  return string.format('require("config/%s")', name)
end

-- bootstrapping / downloading packer. run :PackerSync afterwards if sth. fails
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

return require('packer').startup(function(use)
  -- packer for plugin management itself
  use 'wbthomason/packer.nvim'

  -- nvim tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = get_config('nvim-tree'),
  }

  -- Treesitter for nicer syntax-highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    config = get_config('treesitter'),
    requires = {
      "windwp/nvim-ts-autotag"
    },
    run = ':TSUpdate',
  }

  -- lsp and null-ls for diagnostics and formatting (eslint_d, stylelint etc.)
  use {
    'jose-elias-alvarez/nvim-lsp-ts-utils',
  }

  -- Additional LSP support for specific libraries like tailwindcss
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    config = get_config('mason'),
  }

  use {
    'neovim/nvim-lspconfig',
    config = get_config('lspconfig')
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = get_config('null-ls'),
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- autocompletion and snippets
  use {
    'hrsh7th/nvim-cmp',
    config = get_config('cmp'),
    requires = {
      'andersevenrud/cmp-tmux',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
    },
  }
  use {
    'hrsh7th/vim-vsnip',
    config = get_config('vsnip')
  }
  use {
    'rafamadriz/friendly-snippets',
    requires = {
      'hrsh7th/vim-vsnip',
    },
  }

  -- fzf integration
  use {
    'ibhagwan/fzf-lua',
    config = get_config('fzf'),
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
    },
  }

  -- autopairs for sensible () "" ''
  use {
    'windwp/nvim-autopairs',
    config = get_config('autopairs')
  }

  -- colorizer for nice css-colors
  use {
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPre',
    config = get_config('colorizer'),
  }

  -- graphql syntax highlighting
  use {
    'jparise/vim-graphql',
  }

  -- commenting stuff out
  use {
    'numToStr/Comment.nvim',
    config = get_config('comment')
  }

  -- nice status line
  use {
    'nvim-lualine/lualine.nvim',
    config = get_config('lualine'),
    event = 'VimEnter',
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true }
    },
  }

  -- git diff
  use {
    'tpope/vim-fugitive',
  }

  -- markdown preview
  use {
    'davidgranstrom/nvim-markdown-preview',
    config = get_config('markdown-preview'),
  }

  -- finally: the colorscheme of choice
  -- 'justb3a/vim-smarties',
  use {
    'ellisonleao/gruvbox.nvim',
    requires = { 'rktjmp/lush.nvim' },
  }

  -- oldschool vimscript plugins that still provide a lot of value
  use 'christoomey/vim-tmux-navigator'
  use 'editorconfig/editorconfig-vim'
  use 'wincent/terminus'
  use 'dhruvasagar/vim-table-mode'

  -- automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
