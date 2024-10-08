-- Consider also none-ls, community follow-up from null-ls (used before).
-- Instead of nvim-lint and typescript-tools and conform.
-- https://github.com/nvimtools/none-ls.nvim
return {

  { -- Linting
    'mfussenegger/nvim-lint',
    -- event = { 'BufReadPre', 'BufNewFile' },
    events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        text = { 'vale' },
        javascript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        css = { 'stylelint' },
        scss = { 'stylelint' },
        yaml = { 'yamllint' },
        json = { 'jsonlint' },
        dockerfile = { 'hadolint' },
      }

      -- -- Create autocommand which carries out the actual linting
      -- -- on the specified events.
      -- local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      -- -- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      -- vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
      --   group = lint_augroup,
      --   callback = function()
      --     lint.try_lint()
      --   end,
      -- })
    end,
  },
}
