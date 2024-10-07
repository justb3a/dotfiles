local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  }
end

local function on_attach(client,bufnr)
  if client.supports_method 'textDocument/formatting' then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = { on_attach = on_attach },
  config = function()
    local null_ls = require 'null-ls'
    local b = null_ls.builtins


    null_ls.setup {
      sources = {
        -- js and friends via eslint_d
        require("none-ls.diagnostics.eslint_d"), -- requires none-ls-extras.nvim
        require("none-ls.formatting.eslint_d"), -- requires none-ls-extras.nvim
        require("none-ls.code_actions.eslint_d"), -- requires none-ls-extras.nvim
        -- b.diagnostics.eslint_d,
        -- b.formatting.eslint_d,
        -- b.code_actions.eslint_d,

        -- prettier
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#prettier
        -- b.formatting.prettier,
        b.formatting.prettierd.with { prefer_local = 'node_modules/.bin' },

        -- css and scss-files
        b.diagnostics.stylelint.with { prefer_local = 'node_modules/.bin' },
        b.formatting.stylelint.with { prefer_local = 'node_modules/.bin' },

        -- use prettier
        -- markdown
        -- b.diagnostics.markdownlint,
        -- b.formatting.markdownlint,

        -- other languages
        -- But you can use null-ls for that
        -- null-ls has a built-in source null_ls.builtins.diagnostics.tsc that provides workspace diagnostics
        b.diagnostics.tsc,
        b.diagnostics.yamllint,
        -- b.formatting.fixjson,
      },
    }
  end,
}
