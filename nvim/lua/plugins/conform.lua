-- Autoformat
-- consider BufWritePre for prettier in confirm

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    log_level = vim.log.levels.DEBUG,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- You can use 'stop_after_first' to run the first available formatter from the list
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      -- go = { 'goimports', 'gofmt' },

      ['*'] = { 'codespell' },
      -- Use the "_" filetype to run formatters on filetypes that don't have other formatters configured.
      ['_'] = { 'trim_whitespace' },
    },
  },
  -- config = function()
  --   vim.api.nvim_create_autocmd('BufWritePre', {
  --     pattern = '*',
  --     callback = function(args)
  --       require('conform').format { bufnr = args.buf, lsp_fallback = true }
  --     end,
  --   })
  -- end,
}
