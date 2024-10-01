-- set the leader key to comma
-- vim.api.nvim_set_keymap('n', ',', '', {})
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights on search' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- use the arrowkeys for usefull stuff in normal mode -- switching buffers
vim.keymap.set('n', '<up>', '<cmd>bfirst<cr>')
vim.keymap.set('n', '<down>', '<cmd>blast<cr>')
vim.keymap.set('n', '<left>', '<cmd>bp<cr>')
vim.keymap.set('n', '<right>', '<cmd>bn<cr>')

-- -- easieser splits
vim.keymap.set('n', '<leader>,', '<C-w>v<C-w>l')
vim.keymap.set('n', '<leader>-', '<C-w>s<C-w>j')

-- one-off bypassing of Prettier
vim.cmd ':command! W noautocmd w'

-- remap semi-colon to be colon in normal an visual mode
vim.keymap.set('n', ';', ':')
vim.keymap.set('v', ';', ':')

-- bubbling of lines/selections with alt + hjkl
-- for mapping ALT+hjkl, use instead the real character generated
-- k ∆  up / j º  down / l @ right / h ª left
-- terminal > profiles > Keyboard
-- S-Up: \033[1;2A | S-Down: \033[1;2A | S-Right: \033[1;2C | S-Left: \033[1;2D
vim.keymap.set('n', '<S-Up>', ':move .-2<cr>', { noremap = false })
vim.keymap.set('v', '<S-Up>', ":move '<-2<cr>gv", { noremap = false })

vim.keymap.set('n', '<S-Down>', ':move .+1<cr>', { noremap = false })
vim.keymap.set('v', '<S-Down>', ":move '>+1<cr>gv", { noremap = false })

vim.keymap.set('n', '<S-left>', '<<', { noremap = false })
vim.keymap.set('v', '<S-left>', '<gv', { noremap = false })

vim.keymap.set('n', '<S-right>', '>>', { noremap = false })
vim.keymap.set('v', '<S-right>', '>gv', { noremap = false })

-- fast switch between windows / buffers with tab
vim.keymap.set('n', '<tab>', '<C-w><C-w>')
vim.keymap.set('n', '<S-tab>', '<C-w>W')

vim.keymap.set('n', '<leader>w', '<cmd>set wrap! wrap?<cr>')

-- Keeping it centered when searching and jumping to next entry
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- -----------------------------------------------------
-- Miscelangelo
-- -----------------------------------------------------
-- -- opens an edit command with the path of the currently edited file filled in
-- map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/"<cr>', { silent = false })
--
-- -- deactivate ex-mode and man-pages
-- map('n', 'Q', '')
-- map('n', 'K', '')
--
-- -- j and k for wrapped lines
-- map('n', 'j', 'gj')
-- map('n', 'k', 'gk')
--
-- -- sane yanking and copying to clipboard/alfred-history
-- map('n', 'Y', 'y$')
-- map('n', 'y', '"*y')
-- map('n', 'Y', '"*Y')
-- map('n', 'yy', 'yy <cmd>call system("nc localhost 8377", @0)<cr>')
-- map('v', 'y', 'y <cmd>call system("nc localhost 8377", @0)<cr>')
-- map('v', 'Y', 'y <cmd>call system("nc localhost 8377", @0)<cr>')
--
-- -- add undo-repo-breakpoints automatically when writing long text
-- map('i', ',', ',<c-g>u')
-- map('i', '.', '.<c-g>u')
-- map('i', '!', '!<c-g>u')
-- map('i', '?', '?<c-g>u')
--
-- map('n', '<F5>', '<cmd>checktime<cr><cmd>redraw!<cr>');
-- map('n', '<leader>j', '<cmd>lua require("hop").hint_words()<cr>')
-- map('n', '<leader>ve', '<cmd>e $MYVIMRC<cr>')
-- map('n', '<leader>vr', '<cmd>source $MYVIMRC<cr>')
