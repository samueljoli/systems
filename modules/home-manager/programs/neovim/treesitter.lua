require("nvim-treesitter.install").prefer_git = true

require("nvim-treesitter.configs").setup({
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>", -- set to `false` to disable one of the mappings
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<c-backspace>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["of"] = { query = "@function.outer", desc = "Select inner part of a function" },
				["if"] = { query = "@function.inner", desc = "Select outter part of a function" },
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				["la"] = { query = "@assignment.lhs", desc = "Select left hand assignment" },
				["ra"] = { query = "@assignment.rhs", desc = "Select right hand assignment" },
				["ia"] = { query = "@assignment.inner", desc = "Select inner assignment" },
				["oa"] = { query = "@assignment.outer", desc = "Select outer assignment" },
				["os"] = { query = "@statement.outer", desc = "Select outer statement" },
				-- You can also use captures from other query groups like `locals.scm`
				["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
			},
			include_surrounding_whitespace = true,
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["ff"] = "@function.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["FF"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[]"] = "@class.outer",
			},
			goto_next = {
				["]c"] = "@conditional.outer",
			},
			goto_previous = {
				["[c"] = "@conditional.outer",
			},
		},
	},
})

require("treesitter-context").setup({
	max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
})
