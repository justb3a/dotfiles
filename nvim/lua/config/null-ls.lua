local null_ls = require('null-ls')
local b = null_ls.builtins

-- register any number of sources simultaneously
local sources = {
  -- js and friends via eslint_d
  b.diagnostics.eslint_d,
  b.formatting.eslint_d,
  b.code_actions.eslint_d,

  -- prettier
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#prettier
  -- b.formatting.prettier,
  b.formatting.prettierd.with({ prefer_local = 'node_modules/.bin' }),

  -- css and scss-files
  b.diagnostics.stylelint.with({ prefer_local = 'node_modules/.bin' }),
  b.formatting.stylelint.with({ prefer_local = 'node_modules/.bin' }),

  -- use prettier
  -- markdown
  -- b.diagnostics.markdownlint,
  -- b.formatting.markdownlint,

  -- other languages
  b.diagnostics.php,
  b.diagnostics.tsc,
  b.diagnostics.yamllint,
  b.formatting.fixjson,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup {
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
}

-- Run :DisableLspFormatting to disable formatting for the current file
vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)
