-- see also: https://github.com/marilari88/neotest-vitest
-- see also: neotest http://www.lazyvim.org/extras/test/core

return {
  'vim-test/vim-test',
  config = function()
    vim.keymap.set('n', '<leader>t', ':TestNearest<CR>', {})
    vim.keymap.set('n', '<leader>T', ':TestFile<CR>', {})
    vim.keymap.set('n', '<leader>a', ':TestSuite<CR>', {})
    vim.keymap.set('n', '<leader>l', ':TestLast<CR>', {})
    vim.keymap.set('n', '<leader>g', ':TestVisit<CR>', {})

    vim.g['test#strategy'] = 'neovim'
    vim.g['test#javascript#runner'] = 'vitest'
    vim.g['test#typescript#runner'] = 'vitest'
  end,
}
