-- `lazydev.nvim` is a plugin that properly configures LuaLS for editing
-- your Neovim config by lazily updating your workspace libraries.
-- It is used for completion, annotations and signatures of Neovim apis.
return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
}
