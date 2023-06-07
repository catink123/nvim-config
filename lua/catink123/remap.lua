vim.g.mapleader = " "

local bind = vim.keymap.set

bind("n", "<leader>pv", vim.cmd.Ex)
bind('n', '<leader>u', vim.cmd.UndotreeToggle)

bind('v', 'J', ":m '>+1<CR>gv=gv")
bind('v', 'K', ":m '<-2<CR>gv=gv")

bind('n', 'J', 'mzJ`z')

bind('n', '<leader>f', function()
	vim.lsp.buf.format()
end)
