local nvim_tree = require('nvim-tree')
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

local list = {
  { key = {"<CR>"}, cb = tree_cb("edit") },
  { key = "R",      cb = tree_cb("refresh") },
  { key = "a",      cb = tree_cb("create") },
  { key = "d",      cb = tree_cb("remove") },
  { key = "D",      cb = tree_cb("trash") },
  { key = "y",      cb = tree_cb("copy_name") },
  { key = "Y",      cb = tree_cb("copy_path") },
  { key = "gy",     cb = tree_cb("copy_absolute_path") },
  { key = "C",      cb = tree_cb("cd") },
  { key = "-",      cb = tree_cb("dir_up") },
  { key = "P",      cb = tree_cb("parent_node") },
  { key = "K",      cb = tree_cb("first_sibling") },
  { key = "J",      cb = tree_cb("last_sibling") },
  { key = "r",      cb = tree_cb("rename") },
  { key = "f",      cb = tree_cb("full_rename") },
  { key = "x",      cb = tree_cb("cut") },
  { key = "c",      cb = tree_cb("copy") },
  { key = "p",      cb = tree_cb("paste") },
  { key = "g?",     cb = tree_cb("toggle_help") },
  { key = "gp",     cb = tree_cb("prev_git_item") },
  { key = "gn",     cb = tree_cb("next_git_item") },
}

nvim_tree.setup({
  view = {
    width = 40,
    mappings = {
      custom_only = true,
      list = list
    },
    number = true,
    relativenumber = true,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    debounce_delay = 50,
  },
})
