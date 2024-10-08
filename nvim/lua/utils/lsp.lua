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
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      completions = {
        completeFunctionCalls = true,
      },
    },
  },
  yamlls = {},
}

local M = {
  servers = servers,
}

---@param on_attach fun(client:vim.lsp.Client, buffer)
---@param name? string
function M.on_attach(on_attach, name)
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

      -- vim.keymap.set('n', '?', vim.lsp.buf.implementation, { buffer = event.buf, desc = 'LSP: Jump to the implementation' })
      -- vim.keymap.set('n', '?', require('telescope.builtin').lsp_implementations, { buffer = event.buf, desc = 'LSP: Jump to the implementation' })

      -- vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, { buffer = event.buf, desc = 'LSP: Goto declaration (not definition!)' })

      -- vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { buffer = event.buf, desc = 'LSP: Fuzzy find all symbols in your current document' })
      -- vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { buffer = event.buf, desc = 'LSP: Fuzzy find all symbols in your current workspace' })

      local client = vim.lsp.get_client_by_id(event.data.client_id)

      -- Toggle inlay hints in your code, if the language server you are using supports them
      -- Enable inlay hints by default: vim.lsp.inlay_hint.enable()
      if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
        vim.keymap.set('n', '<leader>th', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
        end, { buffer = event.buf, desc = 'LSP: Toggle Inlay hints' })
      end

      -- Highlight references of the word under your cursor.
      -- When you move your cursor, the highlights will be cleared.
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

      if client and (not name or client.name == name) then
        return on_attach(client, event.buf)
      end
    end,
  })
end

return M
