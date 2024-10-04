-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    signs = true,
    -- signs = {
    --   severity_limit = "Warning",
    -- },
    virtual_text = {
      severity_limit = "Warning",
      spacing = 4,
    },
  }
)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
end

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['solargraph'].setup {
  capabilities = capabilities
}

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['solargraph'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rome'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['ts_ls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['svelte'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
-- require('lspconfig')['tailwindcss'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }

-- Setup nvim-cmp.
-- local cmp = require'cmp'

-- cmp.setup({
--   snippet = {
--     -- REQUIRED - you must specify a snippet engine
--     expand = function(args)
--       vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--     end,
--   },
--   window = {
--     completion = cmp.config.window.bordered(),
--     documentation = cmp.config.window.bordered(),
--   },
--   mapping = cmp.mapping.preset.insert({
--     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-e>'] = cmp.mapping.abort(),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--   }),
--   sources = cmp.config.sources({
--     { name = 'nvim_lsp' },
--     { name = 'vsnip' }, -- For vsnip users.
--   }, {
--     { name = 'buffer' },
--   })
-- })

-- -- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = 'buffer' },
--   })
-- })

--   cmp.setup.cmdline('/', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--       { name = 'buffer' }
--     }
--   })

--   cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--       { name = 'path' }
--     }, {
--       { name = 'cmdline' }
--     })
--   })

-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
-- cmp.event:on(
--   'confirm_done',
--   cmp_autopairs.on_confirm_done()
-- )
