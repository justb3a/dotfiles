-- Does not work for filepaths containing $ () and such out-of-the-box
-- Edit repo in `/.local/share/nvim/lazy/vim-test`
-- modified:   autoload/test/javascript/vitest.vim
-- @ autoload/test/javascript/vitest.vim:21 @ function!
-- test#javascript#vitest#build_position(type, position) abort
--     if !empty(name)
--       let name = '-t '.shellescape(escape(name, '()[]'), 1)
--     endif
--  -  return ['run', name, a:position['file']]
--  +  return ['run', name, substitute(a:position['file'], '[$()]', '\\\0', 'g')]
--   elseif a:type ==# 'file'
--  -  return ['run', a:position['file']]
--  +  return ['run', substitute(a:position['file'], '[$()]', '\\\0', 'g')]
--   else

return {
  'vim-test/vim-test',
  dependencies = { 'preservim/vimux' },
  config = function()
    vim.keymap.set('n', '<leader>t', ':TestFile<CR>', {})
    vim.keymap.set('n', '<leader>T', ':TestNearest<CR>', {})
    vim.keymap.set('n', '<leader>a', ':TestSuite<CR>', {})
    vim.keymap.set('n', '<leader>l', ':TestLast<CR>', {})
    vim.keymap.set('n', '<leader>g', ':TestVisit<CR>', {})

    vim.g['test#javascript#runner'] = 'vitest'
    vim.g['test#typescript#runner'] = 'vitest'

    -- vim.g['test#strategy'] = 'vimux'
    -- vim.g['test#strategy'] = 'neovim'
    vim.g['test#strategy'] = 'neovim_sticky'

    -- Reopen split if not visible
    vim.g['test#neovim_sticky#reopen_window'] = 1

    -- Try to abort previous run
    vim.g['test#neovim_sticky#kill_previous'] = 1

    -- Have the terminal open in normal mode, so it does not close on key press
    vim.g['test#neovim_sticky#start_normal'] = 1

    -- clear screen from previous run
    vim.g['test#preserve_screen'] = 0
    -- vim.cmd 'let g:test#preserve_screen = 0'

    -- do not output test command
    vim.g['test#echo_command'] = 0
    -- vim.cmd 'let g:test#echo_command = 0'
  end,
}
