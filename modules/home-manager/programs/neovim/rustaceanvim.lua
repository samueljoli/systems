vim.g.rustaceanvim = {
	-- Plugin configuration
	-- tools = {},
	-- LSP configuration
	server = {
		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				files = {
					excludeDirs = { ".direnv" },
				},
			},
		},
	},
	-- DAP configuration
	-- dap = {},
}
