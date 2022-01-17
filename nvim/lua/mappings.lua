-- set the leader key to comma
vim.api.nvim_set_keymap('n', ',', '', {})
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- helper function for easier mappings
local map = function(mode, lhs, rhs, opts)
  return vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend('keep', opts or {}, {
    nowait = true,
    silent = true,
    noremap = true,
  }))
end

-- remap semi-colon to be colon in normal an visual mode
map('n', ';', ':')
map('v', ';', ':')

-- easieser splits
map('n', '<leader>,', '<C-w>v<C-w>l')
map('n', '<leader>-', '<C-w>s<C-w>j')

-- deactivate ex-mode and man-pages
map('n', 'Q', '')
map('n', 'K', '')

-- opens an edit command with the path of the currently edited file filled in
map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/"<cr>', { silent = false })

-- use the arrowkeys for usefull stuff in normal mode -- switching buffers
map('n', '<up>', '<cmd>bfirst<cr>')
map('n', '<down>', '<cmd>blast<cr>')
map('n', '<left>', '<cmd>bp<cr>')
map('n', '<right>', '<cmd>bn<cr>')

-- fast switch between windows / buffers with tab
map('n', '<tab>', '<C-w><C-w>')
map('n', '<S-tab>', '<C-w>W')

-- Keeping it centered when searching and jumping to next entry
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- j and k for wrapped lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- behave - yank just like D and C
map('n', 'Y', 'y$')

-- auto-yanking with clipper for selected yanking
map('n', 'y', '"*y')
map('n', 'Y', '"*Y')
map('n', 'yy', 'yy <cmd>call system("nc localhost 8377", @0)<cr>')
map('v', 'y', 'y <cmd>call system("nc localhost 8377", @0)<cr>')
map('v', 'Y', 'y <cmd>call system("nc localhost 8377", @0)<cr>')

-- bubbling of lines/selections with alt + hjkl
-- for mapping ALT+hjkl, use instead the real character generated
-- k ∆  up / j º  down / l @ right / h ª left
-- terminal > profiles > Keyboard
-- S-Up: \033[1;2A | S-Down: \033[1;2A | S-Right: \033[1;2C | S-Left: \033[1;2D
map('n', '<S-Up>', ':move .-2<cr>', { noremap = false })
map('v', '<S-Up>', ":move '<-2<cr>gv", { noremap = false })

map('n', '<S-Down>', ':move .+1<cr>', { noremap = false })
map('v', '<S-Down>', ":move '>+1<cr>gv", { noremap = false })

map('n', '<S-left>', '<<', { noremap = false })
map('v', '<S-left>', '<gv', { noremap = false })

map('n', '<S-right>', '>>', { noremap = false })
map('v', '<S-right>', '>gv', { noremap = false })

-- nvim tree
map('n', '<leader>n','<cmd>NvimTreeToggle<cr>')
map('n', '<leader>o','<cmd>NvimTreeFocus<cr>')

-- comment
-- Do not use additional keymaps after a certain one, othervise nvim will wait for more input
-- Check additional keymaps using:
-- `:nmap <leader>e`
map('n', '<leader>.', '<cmd>lua require"Comment.api".toggle_current_linewise()<cr>')
-- map('n', '<leader>.b', '<cmd>lua require"Comment.api".toggle_current_blockwise()<cr>')
map('v', '<leader>.', '<esc><cmd>lua require"Comment.api".toggle_linewise_op(vim.fn.visualmode())<cr>')
-- map('v', '<leader>.b', '<esc><cmd>lua require"Comment.api".toggle_blockwise_op(vim.fn.visualmode())<cr>')
-- map('n', '<leader>.o', '<cmd>lua require"Comment.api".insert_linewise_above()<cr>')
-- map('n', '<leader>.a', '<cmd>lua require"Comment.api".insert_linewise_eol()<cr>')

-- other useful mappings
map('n', '<F5>', '<cmd>checktime<cr><cmd>redraw!<cr>');
map('n', '<leader>ve', '<cmd>e $MYVIMRC<cr>')
map('n', '<leader>vr', '<cmd>source $MYVIMRC<cr>')
map('n', '<leader>w', '<cmd>set wrap! wrap?<cr>')

-- add undo-repo-breakpoints automatically when writing long text
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')

-- fzf-lua
-- map('n', '<leader>,', '<cmd>lua require("fzf-lua").files()<cr>')
-- map('n', '<leader>.', '<cmd>lua require("fzf-lua").buffers()<cr>')
-- map('n', '<leader>/', '<cmd>lua require("fzf-lua").search_history()<cr>')
-- map('n', '<leader>;', '<cmd>lua require("fzf-lua").command_history()<cr>')
-- map('n', '<leader>`', '<cmd>lua require("fzf-lua").files({ cwd = "~/" })<cr>')
-- map('n', '<leader>a', '<cmd>lua require("fzf-lua").grep_project()<cr>')
-- map('n', '<leader>b', '<cmd>lua require("fzf-lua").git_branches()<cr>')
-- map('n', '<leader>c', '<cmd>lua require("fzf-lua").git_bcommits()<cr>')
-- map('n', '<leader>]', '<cmd>lua require("fzf-lua").lines()<cr>')

-- lsp and diagnostics
-- map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
-- map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
-- map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
-- map('n', '<leader>d', '<cmd>lua vim.lsp.buf.declaration()<cr>')
-- map('n', '<leader>e', '<cmd>lua vim.diagnostic.goto_next()<cr>')
-- map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<cr>')
-- map('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<cr>')
-- map('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>')
-- map('n', '<leader>x', '<cmd>lua vim.lsp.buf.code_action()<cr>')

-- git
-- map('n', '<leader>l', '<cmd>FloatermNew lazygit<cr>')
-- map('n', '<leader>gd', '<cmd>DiffviewOpen<cr>')
-- map('n', '<leader>gc', '<cmd>DiffviewClose<cr>')
-- map('n', '<leader>gh', '<cmd>DiffviewFileHistory<cr>')
-- map('n', '<leader>gf', '/\\v^[<\\|=>]{7}( .*\\|$)<cr>')

-- vsnip snippets expansion
-- map('i', '<C-j>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"', { expr = true, noremap = false })
-- map('s', '<C-j>', 'vsnip#available(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-j>"', { expr = true, noremap = false })

