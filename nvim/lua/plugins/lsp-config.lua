-- [L]anguage [S]erver [P]rotocol
-- Allows communication between text editors and lsps running on your machine
--
-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
-- and elegantly composed help section, `:help lsp-vs-treesitter`
local Lsp = require 'utils.lsp'

return {
  { 'artemave/workspace-diagnostics.nvim', event = { 'LspAttach' } },
  {
    -- Plugin to help utilize capabilities of vtsls.
    'yioneko/nvim-vtsls',
    event = { 'BufReadPre', 'BufNewFile' },
    ft = { 'typescript', 'typescriptreact' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
  },
  {
    'williamboman/mason.nvim',
    --     config = function()
    --       require('mason').setup()
    --     end,
    opts = {
      ensure_installed = {
        'vtsls', -- Vanilla TypeScript Language Server
      },
    },
  },
  --   {
  --     -- Install or upgrade all of your third-party tools.
  --     'WhoIsSethDaniel/mason-tool-installer.nvim',
  --     config = function()
  --       local ensure_installed = vim.tbl_keys(Lsp.servers or {})
  --       vim.list_extend(ensure_installed, {
  --         'editorconfig-checker',
  --         'eslint_d',
  --         'stylua',
  --         'tailwindcss',
  --         'prettierd',
  --       })
  --
  --       require('mason-tool-installer').setup {
  --         auto_update = true,
  --         ensure_installed = ensure_installed,
  --       }
  --     end,
  --   },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'j-hui/fidget.nvim', opts = {} }, -- Useful status updates for LSP.
      'hrsh7th/cmp-nvim-lsp', -- Allows extra capabilities provided by nvim-cmp
    },

    config = function()
      local lspconfig_defaults = require('lspconfig').util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend('force', lspconfig_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Call on module imported on top
      Lsp.on_attach(function(client, bufnr)
        -- if client.name == 'eslint' then
        --   vim.api.nvim_create_autocmd('BufWritePre', {
        --     buffer = bufnr,
        --     command = 'lua vim.lsp.buf.format()',
        --   })
        -- end
      end)

      -----------
      -- SERVERS
      local lspconfig = require 'lspconfig'

      lspconfig.cssls.setup {
        filetypes = { 'css', 'sass', 'scss' },
        settings = { css = { validate = false }, scss = { validate = false }, sass = { validate = false } },
      }

      lspconfig.eslint.setup {
        -- on_attach = function(client, bufnr)
        --   vim.api.nvim_create_autocmd('BufWritePre', {
        --     buffer = bufnr,
        --     command = 'EslintFixAll',
        --   })
        -- end,
      }

      lspconfig.html.setup {}
      lspconfig.jsonls.setup {}
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            completion = { callSnippet = 'Replace' },
            hint = { enable = true, arrayIndex = 'Disable' },
          },
        },
      }
      lspconfig.marksman.setup {}
      lspconfig.tailwindcss.setup {}
      -- require('lspconfig').ts_ls.setup {}

      lspconfig.vtsls.setup {
        on_attach = function(client, bufnr)
          require('workspace-diagnostics').populate_workspace_diagnostics(client, bufnr)

          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'lua vim.lsp.buf.format()',
          })
        end,

        settings = {
          vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = {
              -- Inlay hint truncation.
              -- maxInlayHintLength = 30,
              -- For completion performance.
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          typescript = {
            inlayHints = {
              parameterNames = { enabled = 'all' },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
            suggest = { completeFunctionCalls = true },
          },
          -- tsserver = {
          --   useSeparateSyntaxServer = true,
          --   experimental = {
          --     -- Unfortunately this does weird things
          --     enableProjectDiagnostics = true,
          --   },
          -- },
          javascript = {
            inlayHints = {
              parameterNames = { enabled = 'all' },
              parameterTypes = { enabled = true },
            },
          },
        },

        root_dir = lspconfig.util.root_pattern('tsconfig.json', 'package.json', '.git'),
      }

      lspconfig.yamlls.setup {}
    end,
  },
}
