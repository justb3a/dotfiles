return {
  -- graphql syntax highlighting
  { 'jparise/vim-graphql' },
  -- git diff
  { 'tpope/vim-fugitive' },
  -- abbreviation, substitution, coercion
  { 'tpope/vim-abolish' },
  -- finally: the colorscheme of choice
  {
    'ellisonleao/gruvbox.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
  },
  -- oldschool vimscript plugins that still provide a lot of value
  { 'christoomey/vim-tmux-navigator' },
  { 'editorconfig/editorconfig-vim' },
  { 'wincent/terminus' },
  { 'dhruvasagar/vim-table-mode' },
}
