-- commenting stuff out
return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup {
      mappings = {
        basic = false,
      },
    }
  end,
}
