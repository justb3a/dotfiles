-- "Native" TSServer client.
return {
  {
    'pmizio/typescript-tools.nvim',
    event = { 'BufReadPost *.ts,*.tsx,*.js,*.jsx', 'BufNewFile *.ts,*.tsx,*.js,*.jsx' },
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      on_attach = function()
        vim.keymap.set('n', 'tf', '<cmd>:TSToolsRenameFile<cr>')
        vim.keymap.set('n', 'ta', '<cmd>:TSToolsAddMissingImports<cr>')
        vim.keymap.set('n', 'to', '<cmd>:TSToolsOrganizeImports<cr>')
        vim.keymap.set('n', 'tc', '<cmd>:TSToolsRemoveUnused<cr>')
      end,
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
        -- expose_as_code_action = { 'fix_all', 'add_missing_imports', 'remove_unused', 'remove_unused_imports', 'organize_imports' },
      },
    },
  },
}
