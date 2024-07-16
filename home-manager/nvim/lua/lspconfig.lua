local nvim_lsp = require('lspconfig')
local protocol = require 'vim.lsp.protocol'

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<S-C-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.buf.formatting()<CR>", opts)

  -- if client.server_capabilities.documentFormattingProvider then
  --   vim.api.nvim_command [[
  --       augroup Format
  --         autocmd! BufWritePre <buffer> lua vim.lsp.buf.format()
  --       augroup END
  --   ]]
  -- end

  protocol.CompletionItemKind = {
    ' ', -- Text
    ' ', -- Method
    '󰊕', -- Function
    ' ', -- Field
    '󰫧 ', -- Variable
    ' ', -- Class
    ' ', -- Interface
    '󰕳 ', -- Module
    ' ', -- Property
    ' ', -- Unit
    ' ', -- Value
    ' ', -- Enum
    ' ', -- Keyword
    '﬌ ', -- Snippet
    ' ', -- Color
    ' ', -- File
    ' ', -- Reference
    ' ', -- Folder
    ' ', -- EnumMember
    ' ', -- Constant
    ' ', -- Struct
    ' ', -- Event
    'ﬦ ', -- Operator
    ' ' -- TypeParameter
  }
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Set up clangd for C/C++
nvim_lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'cpp', 'c' },
}

-- Set up lua_ls for Lua
nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'lua' },
}

-- Optional: Set up diagnosticls if you need it for linting and formatting
nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { 'cpp', 'lua' },
  init_options = {
    linters = {},
    filetypes = {
      cpp = 'clangd',
      lua = 'lua_ls',
    },
    formatters = {},
    formatFiletypes = {
      css = 'prettier',
      json = 'prettier',
    },
  },
}

