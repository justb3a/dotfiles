-- markdown preview
return {
  'davidgranstrom/nvim-markdown-preview',
  config = function()
    local g = vim.g

    -- https://github.com/davidgranstrom/nvim-markdown-preview
    -- :MarkdownPreview
    g.nvim_markdown_preview_theme = 'solarized-light'
  end,
}
