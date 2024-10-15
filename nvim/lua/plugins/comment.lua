-- https://github.com/numToStr/Comment.nvim
return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter',
  },
  lazy = false,
  config = function()
    require('ts_context_commentstring').setup()

    require('Comment').setup {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      mappings = {
        basic = false,
        extra = false,
      },
    }

    vim.keymap.set('n', '<leader>.', '<cmd>lua require"Comment.api".toggle.linewise.current()<cr>')
    vim.keymap.set('v', '<leader>.', '<esc><cmd>lua require"Comment.api".toggle.linewise(vim.fn.visualmode())<cr>')
    -- map('n', '<leader>.b', '<cmd>lua require"Comment.api".toggle_current_blockwise()<cr>')
    -- map('v', '<leader>.b', '<esc><cmd>lua require"Comment.api".toggle_blockwise_op(vim.fn.visualmode())<cr>')
    -- map('n', '<leader>.o', '<cmd>lua require"Comment.api".insert_linewise_above()<cr>')
    -- map('n', '<leader>.a', '<cmd>lua require"Comment.api".insert_linewise_eol()<cr>')
  end,
}
