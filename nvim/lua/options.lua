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
vim.opt.listchars = { tab = '· ', trail = '·', nbsp = '␣', extends = '»', precedes = '«', multispace = '· ' }

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

-- vim.opt.cmdheight = 2
-- vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
-- vim.opt.cpoptions:append '$'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- -- vim.opt.foldenable = false
-- vim.opt.foldmethod = 'manual'
-- vim.opt.gdefault = true
-- vim.opt.grepprg = 'rg'
-- vim.opt.hidden = true
-- vim.opt.infercase = true
-- vim.opt.lazyredraw = true
-- vim.opt.linebreak = true
-- vim.opt.swapfile = false
-- vim.opt.writebackup = false
-- vim.opt.scrolljump = 5
-- vim.opt.shortmess:append 'c'
-- vim.opt.showbreak = '↳ '
-- vim.opt.showmatch = true
-- vim.opt.sidescroll = 10
-- vim.opt.sidescrolloff = 5
-- vim.opt.virtualedit = 'all'
-- vim.opt.visualbell = true
-- vim.opt.wildmode = { 'list:longest', 'list:full' }

vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.cmd 'language en_US.UTF-8'
