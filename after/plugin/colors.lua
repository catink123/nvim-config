function SetColors(colors)
	colors = colors or "midnight"
	vim.cmd.colorscheme(colors)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColors()
