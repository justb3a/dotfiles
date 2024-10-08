return {
  'echasnovski/mini.indentscope', -- indent guides
  version = false,
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    symbol = '│',
    options = { try_as_border = true },
  },
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'help',
        'dashboard',
        'lazy',
        'mason',
        'notify',
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
