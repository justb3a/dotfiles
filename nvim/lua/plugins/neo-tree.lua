-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
local NeoTree = require 'utils.neo-tree'

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>n', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
      { '<leader>o', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    config = function()
      vim.diagnostic.config {
        signs = { text = NeoTree.diagnostic_signs },
      }

      require('neo-tree').setup {
        commands = { copy_selector = NeoTree.copy_selector },
        sources = { 'filesystem', 'buffers', 'git_status' },
        enable_git_status = true,
        git_status_async = true,
        enable_diagnostics = true,
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = true,
            hide_gitignored = false,
            hide_by_name = { '.DS_Store' },
          },
          window = {
            mappings = {
              ['<leader>o'] = 'close_window',
            },
          },
        },
        window = {
          mappings = {
            ['z'] = '',
            ['c'] = { 'copy_to_clipboard' },
            ['<space>'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
            ['Y'] = 'copy_selector',
          },
        },
        default_component_configs = {
          modified = {
            symbol = '[+]',
            highlight = 'NeoTreeModified',
          },
          git_status = NeoTree.git_status,
        },
      }
    end,
  },
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neo-tree/neo-tree.nvim',
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
  },
}
