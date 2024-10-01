local servers = {
  -- Enable the following language servers
  -- See `:help lspconfig-all` for a list of all the pre-configured LSPs
  --
  -- npm install -g @tailwindcss/language-server
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
  html = {},
  jsonls = {},
  yamlls = {},
  cssls = {
    filetypes = { 'css', 'sass', 'scss' },
    settings = {
      css = { validate = false },
      scss = { validate = false },
      sass = { validate = false },
    },
  },
  marksman = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = { callSnippet = 'Replace' },
        hint = { enable = true, arrayIndex = 'Disable' },
      },
    },
  },
}

-- Main LSP Configuration
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} }, -- Useful status updates for LSP.
    'hrsh7th/cmp-nvim-lsp', -- Allows extra capabilities provided by nvim-cmp
  },
  config = function()
    -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
    -- and elegantly composed help section, `:help lsp-vs-treesitter`

    --  This function gets run when an LSP attaches to a particular buffer.
    --    That is to say, every time a new file is opened that is associated with
    --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
    --    function will be executed to configure the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        -- easier mapping
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Move to the next diagnostic.
        map('<leader>N', vim.diagnostic.goto_next, 'Move to next diagnostic')
        -- Move to the previous diagnostic in the current buffer.
        map('<leader>P', vim.diagnostic.goto_prev, 'Move to prev diagnostic')

        -- Displays hover information about the symbol under the cursor in a floating window.
        -- Calling the function twice will jump into the floating window.
        map('tt', vim.lsp.buf.hover, '[tt]ype information')

        -- Rename the variable under your cursor.
        map('tn', vim.lsp.buf.rename, '[T]ype re[n]ame')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('ti', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        map('td', vim.lsp.buf.definition, 'To Definition', { 'n', 'x' })
        -- map('td', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        -- vim.keymap.set('n', 'td', '<cmd>:TSToolsGoToSourceDefinition<cr>')

        -- Find references for the word under your cursor.
        map('tr', vim.lsp.buf.references, 'To References', { 'n', 'x' })
        -- map('tr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        -- vim.keymap.set('n', 'tr', '<cmd>lua vim.lsp.buf.references()<cr>')
        -- vim.keymap.set('n', 'tr', '<cmd>:TSToolsFileReferences<cr>')

        -- Jump to the implementation of the word under your cursor.
        -- map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        -- map('n', 't?', '<cmd>lua vim.lsp.buf.implementation()<cr>')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        -- map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('t?', vim.lsp.buf.type_definition, 'To type definition', { 'n', 'x' })

        -- Fuzzy find all the symbols in your current document.
        -- map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

        -- Fuzzy find all the symbols in your current workspace.
        -- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')

          -- Enable inlay hints by default
          vim.lsp.inlay_hint.enable()
        end
      end,
    })

    -- LSP servers and clients are able to communicate to each other what features they support.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
