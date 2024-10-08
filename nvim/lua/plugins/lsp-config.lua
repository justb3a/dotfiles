-- [L]anguage [S]erver [P]rotocol
-- Allows communication between text editors and lsps running on your machine
--
-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
-- and elegantly composed help section, `:help lsp-vs-treesitter`

local servers = {
  -- Enable the following language servers
  -- See `:help lspconfig-all` for a list of all the pre-configured LSPs
  cssls = {
    filetypes = { 'css', 'sass', 'scss' },
    settings = { css = { validate = false }, scss = { validate = false }, sass = { validate = false } },
  },
  eslint = {},
  html = {},
  jsonls = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = { callSnippet = 'Replace' },
        hint = { enable = true, arrayIndex = 'Disable' },
      },
    },
  },
  marksman = {},
  tailwindcss = {
    classAttributes = { 'class', 'className', '.*Classes', 'classList', '.*Classes: .*' },
    lint = {
      cssConflict = 'warning',
      invalidApply = 'error',
      invalidConfigPath = 'error',
      invalidScreen = 'error',
      invalidTailwindDirective = 'error',
      invalidVariant = 'error',
      recommendedVariantOrder = 'warning',
    },
    validate = true,
  },
  ts_ls = {
    single_file_support = false,
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
    },
  },
  yamlls = {},
}

return {
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
      local ensure_installed = vim.tbl_keys(servers or {})
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
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      --  This function gets run when an LSP attaches to a particular buffer.
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          -- easier mapping
          vim.keymap.set('n', '<leader>N', vim.diagnostic.goto_next, { buffer = event.buf, desc = 'LSP: Move to next diagnostic' })
          vim.keymap.set('n', '<leader>P', vim.diagnostic.goto_prev, { buffer = event.buf, desc = 'LSP: Move to prev diagnostic' })
          vim.keymap.set('n', 'tt', vim.lsp.buf.hover, { buffer = event.buf, desc = 'LSP: Display hover information about the symbol' })
          vim.keymap.set('n', 'tn', vim.lsp.buf.rename, { buffer = event.buf, desc = 'LSP: Rename the variable under your cursor' })
          vim.keymap.set('n', 'ti', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'LSP: Execute a code action' })
          vim.keymap.set({ 'n', 'x' }, 'td', vim.lsp.buf.definition, { buffer = event.buf, desc = 'LSP: Jump to the definition' })

          vim.keymap.set({ 'n', 'x' }, 'td', vim.lsp.buf.definition, { buffer = event.buf, desc = 'LSP: Jump to the definition' })
          -- vim.keymap.set({ 'n', 'x' }, 'td', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          vim.keymap.set({ 'n', 'x' }, 'tr', vim.lsp.buf.references, { buffer = event.buf, desc = 'LSP: Find references' })
          --vim.keymap.set({ 'n', 'x' }, 'tr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          vim.keymap.set({ 'n', 'x' }, 't?', vim.lsp.buf.type_definition, { buffer = event.buf, desc = 'LSP: Jump to the type' })
          -- vim.keymap.set({ 'n', 'x' }, 't?', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        end,
      })
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
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
  -- {
  --   'dmmulroy/tsc.nvim',
  --   config = function()
  --     require('tsc').setup {
  --       -- auto_open_qflist = false,
  --       -- auto_close_qflist = false,
  --       -- auto_focus_qflist = false,
  --       auto_start_watch_mode = true,
  --       -- use_trouble_qflist = false,
  --       -- use_diagnostics = false,
  --       -- run_as_monorepo = false,
  --       -- -- bin_path = utils.find_tsc_bin(),
  --       -- enable_progress_notifications = false,
  --       -- enable_error_notifications = false,
  --       flags = {
  --         --   noEmit = true,
  --         --   project = function()
  --         --     return utils.find_nearest_tsconfig()
  --         --   end,
  --         watch = true,
  --       },
  --       -- hide_progress_notifications_from_history = true,
  --       -- spinner = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
  --       -- pretty_errors = true,
  --     }
  --   end,
  -- },
}
