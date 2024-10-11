local ensure_installed = {
  'bash',
  'c',
  'comment',
  'css',
  'diff',
  'html',
  'javascript',
  'jsdoc',
  'json',
  'json5',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'regex',
  'scss',
  'tsx',
  'typescript',
  'yaml',
  'vim',
  'vimdoc',
}

local context_commentstring = {
  config = {
    javascript = {
      __default = '// %s',
      jsx_element = '{/* %s */}',
      jsx_fragment = '{/* %s */}',
      jsx_attribute = '// %s',
      comment = '// %s',
    },
    typescript = { __default = '// %s', __multiline = '/* %s */' },
  },
}

return {
  ensure_installed = ensure_installed,
  context_commentstring = context_commentstring,
}
