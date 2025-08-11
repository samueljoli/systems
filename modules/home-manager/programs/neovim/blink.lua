local status_ok, blink = pcall(require, "blink.cmp")

if not status_ok then
	return
end

blink.setup({
	completion = {
		accept = { auto_brackets = { enabled = true } },
		documentation = { auto_show = true },
	},
	fuzzy = { implementation = "lua" },
	keymap = {
		-- [""] = { function(cmp) end },
		["<CR>"] = { "accept", "fallback" },
		["<Tab>"] = {
			function(cmp)
				cmp.select_next()
			end,
		},
		["<S-Tab>"] = {
			function(cmp)
				cmp.select_prev()
			end,
		},
		["<C-l>"] = {
			function(cmp)
				cmp.snippet_forward()
			end,
		},
		["<C-h>"] = {
			function(cmp)
				cmp.snippet_backward()
			end,
		},
	},
})
