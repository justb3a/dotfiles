local lspconfig = require('lspconfig')

lspconfig.cssls.setup({
  filetypes = { 'css', 'sass', 'scss' },
  settings = {
    css = {
      validate = false,
    },
    scss = {
      validate = false,
    },
    sass = {
      validate = false,
    },
  },
})

lspconfig.html.setup({})

lspconfig.jsonls.setup({})

lspconfig.yamlls.setup({})

-- https://github.com/tailwindlabs/tailwindcss-intellisense#extension-settings
lspconfig.tailwindcss.setup({
  settings = {
    tailwindCSS = {
      validate = true,
      classAttributes = {
        'class',
        'className',
        '.*Classes',
        '.*Classes: .*',
      },
    }
  }
})

-- do not call require("lspconfig").tsserver.setup({}) here
-- see typescript.lua
