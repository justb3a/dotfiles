-- lsp and null-ls for diagnostics and formatting (eslint_d, stylelint etc.)
return {
  'jose-elias-alvarez/typescript.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  config = function()
    -- @deprecated
    -- This repository has been archived by the owner on Aug 12, 2023. It is now read-only.
    -- https://github.com/jose-elias-alvarez/typescript.nvim
    -- You can also try typescript-tools.nvim: https://github.com/pmizio/typescript-tools.nvim
    require('typescript').setup {
      disable_commands = false, -- prevent the plugin from creating Vim commands
      debug = false, -- enable debug logging for commands
      go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
      },
      server = {
        on_attach = function(client, bufnr)
          vim.lsp.buf.inlay_hint(bufnr, true)
        end,
        settings = {
          -- specify some or all of the following settings if you want to adjust the default behavior
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
        },
      },
    }
  end,
}
