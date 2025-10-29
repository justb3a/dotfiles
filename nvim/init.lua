require 'mappings'
require 'options'
require 'autocommands'

-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
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
require('lazy').setup('plugins', { ui = { icons = {} } })

--[[
  Plugins are stored in: ~/.local/share/nvim/lazy

  Lua guide: https://learnxinyminutes.com/docs/lua/
  - :help lua-guide
  - (or HTML version): https://neovim.io/doc/user/lua-guide.html

  Run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

  Run `:checkhealth` for more info.

  Nerdfonts: https://www.nerdfonts.com/font-downloads

  Check other configs:
    https://github.com/rafi/vim-config
    https://github.com/ecosse3/nvim
    https://github.com/Allaman/nvim/blob/main/lua/core/plugins/treesitter.lua
    https://github.com/kevinfengcs88/dotfiles/blob/master/.config/nvim/lua/plugins/treesitter.lua
    https://github.com/jellydn/my-nvim-ide
    https://github.com/MariaSolOs/dotfiles/tree/main/.config/nvim
    https://github.com/rockyzhang24/dotfiles/blob/master/.config/nvim/init.lua
    https://github.com/s1n7ax/dotnvim/tree/main/lua/nvim
    https://github.com/nicknisi/dotfiles/tree/main/config/nvim/lua/nisi
    https://github.com/ViViDboarder/vim-settings/blob/master/neovim/lua/init.lua
    https://github.com/Demianeen/neovim
    https://codeberg.org/MarkCodesTheWeb/nvim/src/branch/main/init.lua
    http://www.lazyvim.org/
    https://www.lunarvim.org/docs/configuration/plugins/example-configurations#troublenvim

  About LSP setup:
    https://devpad.net/blog/upgrading-nvim-v010-to-v011
    https://pawelgrzybek.com/reconcile-two-conflicting-lsp-servers-in-neovim-0-11/
    https://github.com/nikolovlazar/dotfiles/blob/main/.config/nvim/lua/plugins/languages/typescript.lua
    https://github.com/Jack-Gitter/dotfiles/blob/main/nvim/lua/plugins/lspmanager.lua
    https://github.com/gpanders/dotfiles/tree/master/.config/nvim/lsp
    https://github.com/nicknisi/dotfiles/blob/main/config/nvim/lua/nisi/plugins/lsp/config.lua
    https://github.com/rockyzhang24/dotfiles/tree/master/.config/nvim/lsp
    https://www.lazyvim.org/extras/lang/typescript
    https://gitlab.com/gomezantoine/dotfiles/-/blob/vtsls_debug/.config/nvim/lua/antoine/lsp/init.lua?ref_type=heads
    https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/lua/plugins/lsp.lua
    https://github.com/rafi/vim-config/blob/master/lua/rafi/plugins/lsp.lua
    https://github.com/ecosse3/nvim/blob/master/lua/plugins/lsp.lua
    https://github.com/kevinfengcs88/dotfiles/blob/master/.config/nvim/lua/plugins/lsp.lua
    https://github.com/MariaSolOs/dotfiles/blob/main/.config/nvim/lua/lsp.lua
    https://github.com/kikedose/dotfiles/blob/main/.config/nvim/lua/nconf/lazy/lsp.lua
    https://github.com/tjdevries/advent-of-nvim/blob/master/nvim/lua/config/plugins/lsp.lua
--]]
