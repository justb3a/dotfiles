return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- Choose the adapter for your test framework
    'marilari88/neotest-vitest', -- for Vitest
  },
  keys = {
    {
      '<leader>t',
      function()
        local neotest = require 'neotest'
        neotest.run.run(vim.fn.expand '%')
        neotest.summary.open()
      end,
      desc = 'Run tests in current file',
    },
    {
      '<leader>tw',
      function()
        local neotest = require 'neotest'
        neotest.summary.open()
        neotest.watch.watch(vim.fn.expand '%') -- Watch the whole file
        -- neotest.watch.toggle(vim.fn.expand '%')
      end,
      desc = 'Watch current file',
    },
    {
      '<leader>tq',
      function()
        local neotest = require 'neotest'
        neotest.watch.stop(vim.fn.expand '%')
        neotest.summary.close()
      end,
      desc = 'Stop watch file',
    },
    {
      '<leader>to',
      function()
        -- require('neotest').output.open { enter = true }
        require('neotest').output_panel.toggle()
      end,
      desc = 'Open test output',
    },
    {
      '<leader>ts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Toggle test summary',
    },
  },
  config = function()
    local neotest = require 'neotest'

    neotest.setup {
      adapters = {
        require 'neotest-vitest' {
          -- You can customize how it finds your Vitest config here
          vitestCommand = './node_modules/.bin/vitest',
          -- vitestCommand = 'npx vitest',
          filter_dir = function(name, rel_path, root)
            return name ~= 'node_modules'
          end,
        },
      },
      -- See all config options with :h neotest.Config
      -- output = {
      --   open_on_run = true,
      -- },
      discovery = {
        -- Drastically improve performance in ginormous projects by
        -- only AST-parsing the currently opened buffer.
        enabled = false,
        -- Number of workers to parse files concurrently.
        -- A value of 0 automatically assigns number based on CPU.
        -- Set to 1 if experiencing lag.
        concurrent = 1,
      },
      running = {
        -- Run tests concurrently when an adapter provides multiple commands to run.
        concurrent = true,
      },
      summary = {
        -- Enable/disable animation of icons.
        animated = false,
      },
    }
  end,
}
