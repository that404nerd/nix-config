local configs = require("nvim-treesitter.configs")
configs.setup {
  sync_install = false,
  highlight = {
    enable = true,
    disable = {}, -- list of languages that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
}
