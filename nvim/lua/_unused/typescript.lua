-- "Native" TSServer client.
-- Consider also https://github.com/yioneko/vtsls
return {
  'pmizio/typescript-tools.nvim',
  event = { 'BufReadPost *.ts,*.tsx,*.js,*.jsx', 'BufNewFile *.ts,*.tsx,*.js,*.jsx' },
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    on_attach = function()
      vim.keymap.set('n', 'tf', '<cmd>:TSToolsRenameFile<cr>')
      vim.keymap.set('n', 'ta', '<cmd>:TSToolsAddMissingImports<cr>')
      vim.keymap.set('n', 'to', '<cmd>:TSToolsOrganizeImports<cr>')
      vim.keymap.set('n', 'tc', '<cmd>:TSToolsRemoveUnused<cr>')

      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.ts,*.tsx,*.jsx,*.js',
        callback = function()
          -- vim.cmd 'TSToolsAddMissingImports sync'
          vim.cmd 'TSToolsOrganizeImports sync'
          -- if package.loaded['conform'] then
          --   require('conform').format { bufnr = args.buf }
          -- end
        end,
      })
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
}
