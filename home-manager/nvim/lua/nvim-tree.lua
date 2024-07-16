require 'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = " ",
      info = " ",
      warning = " ",
      error = " ",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    side = "left",
    number = false,
    relativenumber = false,
  },
}

vim.g.nvim_tree_icons = {
  default = " ",
  symlink = " ",
  git = {
    unstaged = " ",
    staged = "S",
    unmerged = "",
    renamed = "➜ ",
    deleted = " ",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = " ",
    open = " ",
    empty = " ",
    empty_open = " ",
    symlink = " ",
  },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback
