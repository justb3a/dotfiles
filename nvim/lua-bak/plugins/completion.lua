-- autocompletion and snippets
return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'andersevenrud/cmp-tmux',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
    },
    config = function()
      local cmp = require 'cmp'

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
      end

      cmp.setup {
        completion = {
          keyword_length = 3,
        },
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
          end,
        },
        mapping = {
          ['<cr>'] = cmp.mapping.confirm { select = true },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            end
          end, { 'i', 's' }),
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'path' },
          {
            name = 'buffer',
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
          { name = 'vsnip' },
          -- { name = 'tmux', option = { all_panes = false } },
          { name = 'calc' },
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              buffer = '[Buffer]',
              nvim_lsp = '[LSP]',
              path = '[Path]',
              vsnip = '[Snippet]',
              tmux = '[tmux]',
              calc = '[Calc]',
            })[entry.source.name]
            return vim_item
          end,
        },
      }

      cmp.setup.cmdline(':', {
        sources = {
          { name = 'cmdline' },
        },
      })

      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' },
        },
      })
    end,
  },
  {
    'hrsh7th/vim-vsnip',
    config = function()
      local g = vim.g

      -- vsnip config
      g.vsnip_snippet_dirs = {
        os.getenv 'HOME' .. '/Dotfiles/nvim/plugged/friendly-snippets/snippets',
        os.getenv 'HOME' .. '/Dotfiles/snippets/',
      }
      g.vsnip_filetypes = {
        sass = { 'css' },
        scss = { 'css' },
        javascriptreact = { 'javascript' },
        typescriptreact = { 'typescript', 'javascript' },
      }
    end,
  },
  {
    'rafamadriz/friendly-snippets',
    dependencies = {
      'hrsh7th/vim-vsnip',
    },
  },
}
