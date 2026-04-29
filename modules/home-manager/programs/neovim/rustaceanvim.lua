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
					excludeDirs = {
						".direnv",
						".git",
						"node_modules",
						"result",
						"result-*",
						"target",
					},
				},
				diagnostic = {
					refreshSupport = true,
				},
			},
		},
	},
	-- DAP configuration
	-- dap = {},
}
