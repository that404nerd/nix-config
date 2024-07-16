require("ibl").setup {
  exclude = {
    buftypes = { "terminal" },
    filetypes = { "dashboard", "NvimTree", "packer", "lsp-installer" },
  },
  indent = {
    char = "│",
    tab_char = "▏",
  },
  scope = {
    enabled = true,
  },
}

