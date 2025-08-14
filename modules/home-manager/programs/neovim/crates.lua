require("crates").setup({
	lsp = {
		enabled = true,
		actions = true,
		completion = true,
		hover = true,
	},
	completion = {
		blink = {
			use_custom_kind = true,
			kind_text = {
				version = "Version",
				feature = "Feature",
			},
			kind_highlight = {
				version = "BlinkCmpKindVersion",
				feature = "BlinkCmpKindFeature",
			},
			kind_icon = {
				version = " ",
				feature = " ",
			},
		},
		crates = {
			enabled = true,
			max_results = 8,
			min_chars = 3,
		},
	},
})
