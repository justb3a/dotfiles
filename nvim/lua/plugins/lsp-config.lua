-- [L]anguage [S]erver [P]rotocol
-- Allows communication between text editors and lsps running on your machine
--
-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
-- and elegantly composed help section, `:help lsp-vs-treesitter`
local Lsp = require 'utils.lsp'

return {
  { 'artemave/workspace-diagnostics.nvim', event = { 'LspAttach' } },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'vtsls', -- Vanilla TypeScript Language Server
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    version = '*', -- remove after they fix ESLint

    config = function()
      local lspconfig_defaults = require('lspconfig').util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend('force', lspconfig_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end,
      })

      -----------
      -- SERVERS
      local lspconfig = require 'lspconfig'

      require('lspconfig').html.setup {}
      require('lspconfig').cssls.setup {}
      require('lspconfig').jsonls.setup {}
      require('lspconfig').tailwindcss.setup {}
      -- require('lspconfig').ts_ls.setup {}

      lspconfig.vtsls.setup {
        on_attach = function(client, bufnr)
          require('workspace-diagnostics').populate_workspace_diagnostics(client, bufnr)

          -- Keymaps or capabilities here if needed
          local buf_map = function(mode, lhs, rhs)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { silent = true, noremap = true })
          end
          buf_map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
          buf_map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
          buf_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
          buf_map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
        end,

        settings = {
          vtsls = {
            enableMoveToFileCodeAction = true,
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
            suggest = {
              completeFunctionCalls = true,
            },
          },
          javascript = {
            inlayHints = {
              parameterNames = { enabled = 'all' },
              parameterTypes = { enabled = true },
            },
          },
        },

        root_dir = lspconfig.util.root_pattern('tsconfig.json', 'package.json', '.git'),
      }

      require('lspconfig').eslint.setup {
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll',
          })
        end,
      }
    end,
  },
}

-- return {
--   { 'artemave/workspace-diagnostics.nvim', event = { 'LspAttach' } },
--   {
--     'yioneko/nvim-vtsls',
--     event = { 'BufReadPre', 'BufNewFile' },
--     ft = { 'typescript', 'typescriptreact' },
--     dependencies = {
--       'nvim-lua/plenary.nvim',
--       'neovim/nvim-lspconfig',
--     },
--   },
--   {
--     -- NOTE: Must be loaded before dependants
--     'williamboman/mason.nvim',
--     config = function()
--       require('mason').setup()
--     end,
--   },
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
--   {
--     'neovim/nvim-lspconfig',
--     dependencies = {
--       { 'j-hui/fidget.nvim', opts = {} }, -- Useful status updates for LSP.
--       'hrsh7th/cmp-nvim-lsp', -- Allows extra capabilities provided by nvim-cmp
--     },
--     config = function()
--       require('lspconfig.configs').vtsls = require('vtsls').lspconfig
--
--       Lsp.on_attach(function(client, bufnr)
--         if client.name == 'eslint' then
--           vim.api.nvim_create_autocmd('BufWritePre', {
--             buffer = bufnr,
--             command = 'lua vim.lsp.buf.format()',
--           })
--         end
--       end)
--     end,
--   },
--   {
--     'williamboman/mason-lspconfig.nvim',
--     config = function()
--       -- LSP servers and clients are able to communicate to each other what features they support.
--       local capabilities = vim.lsp.protocol.make_client_capabilities()
--       capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
--
--       require('mason-lspconfig').setup {
--         -- See :help mason-lspconfig.setup_handlers()
--         handlers = {
--           function(server_name)
--             -- See :help lspconfig-setup
--             local server = Lsp.servers[server_name] or {}
--             server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
--             require('lspconfig')[server_name].setup(server)
--           end,
--
--           ['ts_ls'] = function()
--             -- Skip since we use vtsls
--           end,
--         },
--       }
--     end,
--   },
-- }
