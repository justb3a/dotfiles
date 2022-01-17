local nvim_tree = require('nvim-tree')
local tree_cb = require'nvim-tree.config'.nvim_tree_callback


-- { key = "<C-r>",  cb = tree_cb("full_rename") },
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
  { key = "x",      cb = tree_cb("cut") },
  { key = "c",      cb = tree_cb("copy") },
  { key = "p",      cb = tree_cb("paste") },
  { key = "g?",     cb = tree_cb("toggle_help") },
}

nvim_tree.setup({
  view = {
    mappings = {
      custom_only = true,
      list = list
    },
    number = true,
    relativenumber = true,
  },
})