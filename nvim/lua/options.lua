-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- For more options, you can see `:help option-list`

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.shiftround = true
vim.opt.shiftwidth = 2

--  See `:help 'list'` and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '· ', trail = '·', nbsp = '␣', extends = '»', precedes = '«' }

vim.opt.signcolumn = 'yes'
-- vim.opt.signcolumn = 'number'

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = false

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
--   vim.opt.clipboard = 'unnamedplus'
-- end)
vim.opt.clipboard = 'unnamed'

-- local set = vim.opt
-- local cmd = vim.cmd
-- local g = vim.g

-- set.cmdheight = 2
-- set.completeopt= { 'menu', 'menuone', 'noselect' }
-- set.cpoptions:append('$')
-- set.foldexpr = 'nvim_treesitter#foldexpr()'
-- -- set.foldenable = false
-- set.foldmethod = 'manual'
-- set.gdefault = true
-- set.grepprg = 'rg'
-- set.hidden = true
-- set.infercase = true
-- set.lazyredraw = true
-- set.linebreak = true
-- set.swapfile = false
-- set.writebackup = false
-- set.scrolljump = 5
-- set.shortmess:append('c')
-- set.showbreak = '↳ '
-- set.showmatch = true
-- set.sidescroll = 10
-- set.sidescrolloff = 5
-- set.virtualedit = 'all'
-- set.visualbell = true
-- set.wildmode = { 'list:longest', 'list:full' }
--
-- -- colorscheme and default language
-- set.background = 'dark'
-- set.termguicolors = true
-- g.gruvbox_italic = 1
--
-- cmd 'colorscheme gruvbox'
-- cmd 'language en_US.UTF-8'
