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
    run = ':TSUpdate',
  }

  -- textobjects, surround, for stuff like cs", cib etc.
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {
    'blackCauldron7/surround.nvim',
    config = get_config('surround'),
  }

  -- lsp and null-ls for diagnostics and formatting (eslint_d, stylelint etc.)
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

  -- git plugin for vim
  use {
    'tpope/vim-fugitive',
  }

  -- git diff view, using lazygit for everything else
  use {
    'sindrets/diffview.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = get_config('diffview'),
  }

  -- finally: the colorscheme of choice
  use {
    'justb3a/vim-smarties',
  }

  -- oldschool vimscript plugins that still provide a lot of value
  use 'christoomey/vim-tmux-navigator'
  use 'editorconfig/editorconfig-vim'
  use 'wincent/terminus'

  -- automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
