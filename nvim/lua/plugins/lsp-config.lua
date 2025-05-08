-- [L]anguage [S]erver [P]rotocol
-- Allows communication between text editors and lsps running on your machine
--
-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
-- and elegantly composed help section, `:help lsp-vs-treesitter`
local Lsp = require 'utils.lsp'

return {
  { 'artemave/workspace-diagnostics.nvim' },
  {
    'yioneko/nvim-vtsls',
    event = { 'BufReadPre', 'BufNewFile' },
    ft = { 'typescript', 'typescriptreact' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
  },
  {
    -- NOTE: Must be loaded before dependants
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    -- Install or upgrade all of your third-party tools.
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      local ensure_installed = vim.tbl_keys(Lsp.servers or {})
      vim.list_extend(ensure_installed, {
        'editorconfig-checker',
        'eslint_d',
        'stylua',
        'tailwindcss',
        'prettierd',
      })

      require('mason-tool-installer').setup {
        auto_update = true,
        ensure_installed = ensure_installed,
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'j-hui/fidget.nvim', opts = {} }, -- Useful status updates for LSP.
      'hrsh7th/cmp-nvim-lsp', -- Allows extra capabilities provided by nvim-cmp
    },
    config = function()
      require('lspconfig.configs').vtsls = require('vtsls').lspconfig

      Lsp.on_attach(function(client, bufnr)
        if client.name == 'eslint' then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            -- command = 'EslintFixAll',
            command = 'lua vim.lsp.buf.format()',
          })
        end
      end)
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      -- LSP servers and clients are able to communicate to each other what features they support.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      require('mason-lspconfig').setup {
        -- See :help mason-lspconfig.setup_handlers()
        handlers = {
          function(server_name)
            -- See :help lspconfig-setup
            local server = Lsp.servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,

          ['ts_ls'] = function()
            -- Skip since we use vtsls
          end,
        },
      }
    end,
  },
}
