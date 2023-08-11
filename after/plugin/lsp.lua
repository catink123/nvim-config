local lsp = require('lsp-zero')

lsp.preset({})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
  'html',
  'cssls',
  'emmet_ls'
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-u>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<Tab>'] = nil,
  ['<S-Tab>'] = nil
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	local bind = vim.keymap.set

	bind('n', 'gd', function() vim.lsp.buf.definition() end, opts)
	bind('n', 'K', function() vim.lsp.buf.hover() end, opts)
	bind('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
	bind('n', '<leader>v', function() vim.diagnostic.open_float() end, opts)
	bind('n', '[d', function() vim.diagnostic.goto_next() end, opts)
	bind('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
	bind('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
	bind('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
	bind('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
	bind('i', '<C-l>', function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
