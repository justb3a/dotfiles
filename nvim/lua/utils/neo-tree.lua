local git_status = {
  symbols = {
    added = '✚', -- or "✚", but this is redundant info if you use git_status_colors on the name
    modified = '', -- or "" or "󰚰", but this is redundant info if you use git_status_colors on the name
    deleted = '✖', -- or "󱘄" this can only be used in the git_status source
    renamed = '󰁕', -- this can only be used in the git_status source
    untracked = '', -- or ''
    ignored = '',
    unstaged = '', -- or ""
    staged = '', -- or ""
    conflict = '',
  },
}

local diagnostic_signs = {
  [vim.diagnostic.severity.ERROR] = '✘',
  [vim.diagnostic.severity.WARN] = '▲',
  [vim.diagnostic.severity.HINT] = '⚑',
  [vim.diagnostic.severity.INFO] = '»',
}

local M = {
  git_status = git_status,
  diagnostic_signs = diagnostic_signs,
}

function M.copy_selector(state)
  local node = state.tree:get_node()
  local filepath = node:get_id()
  local filename = node.name
  local modify = vim.fn.fnamemodify

  local vals = {
    ['1 PATH CWD'] = modify(filepath, ':.'),
    ['2 PATH ~  '] = modify(filepath, ':~'),
    ['3 PATH ABS'] = filepath,
    ['4 FILENAME'] = filename,
    ['5 BASENAME'] = modify(filename, ':r'),
  }

  local options = vim.tbl_filter(function(val)
    return vals[val] ~= ''
  end, vim.tbl_keys(vals))

  if vim.tbl_isempty(options) then
    vim.notify('No values to copy', vim.log.levels.WARN)
    return
  end

  vim.ui.select(options, {
    prompt = 'Choose to copy to clipboard:',
    format_item = function(item)
      return ('%s: %s'):format(item, vals[item])
    end,
  }, function(choice)
    local result = vals[choice]
    if result then
      vim.notify(('Copied: `%s`'):format(result))
      vim.fn.setreg('+', result)
    end
  end)
end

return M
