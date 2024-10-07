return {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons',
  },
  config = function()
    local nvim_tree = require 'nvim-tree'

    local function on_attach(bufnr)
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      vim.keymap.set('n', '<CR>', api.node.open.edit, opts 'Open')
      vim.keymap.set('n', 'R', api.tree.reload, opts 'Refresh')
      vim.keymap.set('n', 'a', api.fs.create, opts 'Create')
      vim.keymap.set('n', 'd', api.fs.remove, opts 'Delete')
      vim.keymap.set('n', 'D', api.fs.trash, opts 'Trash')
      vim.keymap.set('n', 'y', api.fs.copy.filename, opts 'Copy Name')
      vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts 'Copy Relative Path')
      vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts 'Copy Absolute Path')
      vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts 'CD')
      vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts 'Up')
      vim.keymap.set('n', 'P', api.node.navigate.parent, opts 'Parent Directory')
      vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts 'First Sibling')
      vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts 'Last Sibling')
      vim.keymap.set('n', 'r', api.fs.rename, opts 'Rename')
      vim.keymap.set('n', 'f', api.fs.rename_sub, opts 'Rename: Omit Filename')
      vim.keymap.set('n', 'x', api.fs.cut, opts 'Cut')
      vim.keymap.set('n', 'c', api.fs.copy.node, opts 'Copy')
      vim.keymap.set('n', 'p', api.fs.paste, opts 'Paste')
      vim.keymap.set('n', 'g?', api.tree.toggle_help, opts 'Help')
      vim.keymap.set('n', 'gp', api.node.navigate.git.prev, opts 'Prev Git')
      vim.keymap.set('n', 'gn', api.node.navigate.git.next, opts 'Next Git')
    end

    nvim_tree.setup {
      on_attach = on_attach,
      view = {
        width = 40,
        -- mappings = {
        --   custom_only = true,
        -- },
        number = true,
        relativenumber = true,
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        debounce_delay = 50,
      },
    }
  end,
}
