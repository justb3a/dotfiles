-- Collection of various small independent plugins/modules
-- Check out: https://github.com/echasnovski/mini.nvim

return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- require('mini.comment').setup {
    --   mappings = {
    --     comment = '',
    --     comment_line = '<leader>.',
    --     comment_visual = '<leader>.',
    --     textobject = '',
    --   },
    -- }

    -- Simple and easy statusline.
    --local statusline = require 'mini.statusline'
    --statusline.setup { use_icons = vim.g.have_nerd_font }
    ----@diagnostic disable-next-line: duplicate-set-field
    --statusline.section_location = function()
    --  return '%2l:%-2v %2p%%'
    --end
  end,
}
