return {
  'folke/noice.nvim', -- fancy command line/search bar
  event = 'VeryLazy',
  opts = {
    messages = {
      view_search = false,
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
}
