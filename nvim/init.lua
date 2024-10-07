--[[

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

  Run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  Run `:checkhealth` for more info.

--]]

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require 'mappings'
require 'options'
require 'autocommands'

local cmd = vim.cmd

cmd [[
  augroup init
    autocmd!

    " Remember last location/cursor in file
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

    " Autoresize windows/splits when vim resizes
    autocmd VimResized * wincmd =
  augroup END
]]

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_set_keymap('n', '<leader>x', '', {
  noremap = true,
  callback = function()
    for _, client in ipairs(vim.lsp.get_clients()) do
      require('workspace-diagnostics').populate_workspace_diagnostics(client, 0)
    end
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

--  To check the current status of your plugins, run :Lazy
--  To update plugins you can run :Lazy update
-- [[ Configure and install plugins ]]
-- TODO check:
-- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
-- Highlight todo, notes, etc in comments
-- { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
require('lazy').setup('plugins', {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    -- See https://www.nerdfonts.com/font-downloads
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
-- Other configs:
-- https://github.com/rafi/vim-config
-- https://github.com/ecosse3/nvim
-- https://github.com/Allaman/nvim/blob/main/lua/core/plugins/treesitter.lua
-- https://github.com/kevinfengcs88/dotfiles/blob/master/.config/nvim/lua/plugins/treesitter.lua
-- https://github.com/jellydn/my-nvim-ide
-- https://github.com/MariaSolOs/dotfiles/tree/main/.config/nvim
-- https://github.com/rockyzhang24/dotfiles/blob/master/.config/nvim/init.lua
-- http://www.lazyvim.org/
-- https://www.lunarvim.org/docs/configuration/plugins/example-configurations#troublenvim
--
-- Learn Lua: https://learnxinyminutes.com/docs/lua/
