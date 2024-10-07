return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      latex = { enabled = false },
    },
    ft = { 'markdown' },
    keys = {
      {
        '<leader>tm',
        '<cmd>RenderMarkdown toggle<cr>',
        desc = 'Toggle Markdown preview',
      },
    },
  },
  {
    -- Alternative: https://github.com/davidgranstrom/nvim-markdown-preview
    'previm/previm',
    config = function()
      -- define global for open markdown preview, let g:previm_open_cmd = 'open -a Safari'
      vim.g.previm_open_cmd = 'open -a Firefox'
    end,
    ft = { 'markdown' },
    keys = {
      {
        '<leader>m',
        '<cmd>PrevimOpen<cr>',
        desc = 'Markdown preview',
      },
    },
  },
}
