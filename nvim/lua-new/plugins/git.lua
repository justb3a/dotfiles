-- CONSIDER
-- - https://github.com/NeogitOrg/neogit
-- - lazygit (easy GUI for git commands)
--   - macOS: brew install lazygit
-- - lazygit.nvim (open lazygit directly from Neovim with <leader>lg)
--   - <leader> defaults to `space` with Quickstart
--   - https://github.com/kdheepak/lazygit.nvim

return {
  'tpope/vim-fugitive',
  config = function()
    local function isempty(s)
      return s == nil or s == ''
    end

    Toggle_git_status = function()
      local window_number = nil

      for winnr = 1, vim.fn.winnr '$' do
        if not isempty(vim.fn.getwinvar(winnr, 'fugitive_status')) then
          window_number = winnr
        end
      end

      if isempty(window_number) then
        vim.cmd 'Git'
      else
        vim.cmd(window_number .. 'close')
      end
    end

    vim.keymap.set('n', '<leader>gs', '<cmd>lua Toggle_git_status()<cr>')
    vim.keymap.set('n', '<leader>gd', '<cmd>Gdiff<cr><C-w>20+')
    vim.keymap.set('n', '<leader>gw', '<cmd>Gwrite<cr>')
    vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>')
    vim.keymap.set('n', '<leader>gpf', '<cmd>Git push --force-with-lease<cr>')
  end,
}

-- See `:help gitsigns` to understand what the configuration keys do
-- Adds git related signs to the gutter, as well as utilities for managing changes

-- return {
--   'lewis6991/gitsigns.nvim',
--   opts = {
--     signs = {
--       add = { text = '+' },
--       change = { text = '~' },
--       delete = { text = '_' },
--       topdelete = { text = '‾' },
--       changedelete = { text = '~' },
--     },
--   },
-- }

-- return {
--   'lewis6991/gitsigns.nvim',
--   opts = {
--     on_attach = function(bufnr)
--       local gitsigns = require 'gitsigns'
--
--       local function map(mode, l, r, opts)
--         opts = opts or {}
--         opts.buffer = bufnr
--         vim.keymap.set(mode, l, r, opts)
--       end
--
--       -- Navigation
--       map('n', ']c', function()
--         if vim.wo.diff then
--           vim.cmd.normal { ']c', bang = true }
--         else
--           gitsigns.nav_hunk 'next'
--         end
--       end, { desc = 'Jump to next git [c]hange' })
--
--       map('n', '[c', function()
--         if vim.wo.diff then
--           vim.cmd.normal { '[c', bang = true }
--         else
--           gitsigns.nav_hunk 'prev'
--         end
--       end, { desc = 'Jump to previous git [c]hange' })
--
--       -- Actions
--       -- visual mode
--       map('v', '<leader>hs', function()
--         gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
--       end, { desc = 'stage git hunk' })
--       map('v', '<leader>hr', function()
--         gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
--       end, { desc = 'reset git hunk' })
--       -- normal mode
--       map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
--       map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
--       map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
--       map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
--       map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
--       map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
--       map('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
--       map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
--       map('n', '<leader>hD', function()
--         gitsigns.diffthis '@'
--       end, { desc = 'git [D]iff against last commit' })
--       -- Toggles
--       map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
--       map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
--     end,
--   },
-- }
