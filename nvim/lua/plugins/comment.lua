-- https://github.com/numToStr/Comment.nvim
return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup {
      mappings = {
        basic = false,
        extra = false,
      },
      pre_hook = function()
        return vim.bo.commentstring
      end,
    }
  end,
  lazy = false,
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter',
  },
}
