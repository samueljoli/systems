require("crates").setup({
	lsp = {
		enabled = true,
		-- on_attach = function (client, bufnr)
		--
		-- end
		actions = true,
		completion = true,
		hover = true,
	},
	completion = {
		crates = {
			enabled = true,
			max_results = 4,
			min_chars = 3,
		},
		cmp = {
			enabled = true,
		},
	},
})
