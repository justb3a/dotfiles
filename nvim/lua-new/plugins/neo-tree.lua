-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
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
  opts = {
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
  },
}
