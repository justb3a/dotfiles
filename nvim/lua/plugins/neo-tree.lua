-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

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
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.HINT] = '⚑',
            [vim.diagnostic.severity.INFO] = '»',
          },
        },
      }

      require('neo-tree').setup {
        sources = { 'filesystem', 'buffers', 'git_status' },
        enable_git_status = true,
        git_status_async = true,
        enable_diagnostics = true,
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = true,
            hide_gitignored = false,
            hide_by_name = {
              -- '.git',
              '.DS_Store',
              -- 'thumbs.db',
            },
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
          },
        },
        default_component_configs = {
          modified = {
            symbol = '[+]',
            highlight = 'NeoTreeModified',
          },
          git_status = {
            symbols = {
              added = '󰎔 ', -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified = ' ', -- or "" or "󰚰", but this is redundant info if you use git_status_colors on the name
              deleted = '✖ ', -- or "󱘄" this can only be used in the git_status source
              renamed = '󱘄 ', -- or '󰁕' this can only be used in the git_status source
              untracked = ' ',
              ignored = ' ',
              unstaged = ' ',
              staged = '',
              conflict = '',
            },
          },
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
