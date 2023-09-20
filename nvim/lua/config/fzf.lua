-- use <C-i> to mark all files and hit Enter to open a list of all the marked search results
require('fzf-lua').setup({
  files = {
    multiprocess = true,
  },
  grep = {
    multiprocess = true,
  },
  git = {
    files = {
      multiprocess = true,
    },
  },
  winopts = {
    fullscreen = true,
    width = 0.98,
    height = 0.89,
    row = 0.55,
    col = 0.48,
  },
})
