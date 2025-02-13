vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {
		test_executor = "background",
	},
	-- LSP configuration
	server = {
		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				files = {
					excludeDirs = { ".direnv" },
				},
				diagnostic = {
					refreshSupport = false,
				},
			},
		},
	},
	-- DAP configuration
	-- dap = {},
}
