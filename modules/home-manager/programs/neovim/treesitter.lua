require("nvim-treesitter").setup({})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = true,
		include_surrounding_whitespace = true,
	},
	move = {
		set_jumps = true,
	},
})

local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")

local select_objects = {
	["of"] = "@function.outer",
	["if"] = "@function.inner",
	["ic"] = "@class.inner",
	["la"] = "@assignment.lhs",
	["ra"] = "@assignment.rhs",
	["ia"] = "@assignment.inner",
	["oa"] = "@assignment.outer",
	["os"] = "@statement.outer",
	["as"] = { query = "@scope", query_group = "locals" },
}

for key, object in pairs(select_objects) do
	local query = object
	local query_group = "textobjects"

	if type(object) == "table" then
		query = object.query
		query_group = object.query_group
	end

	vim.keymap.set({ "x", "o" }, key, function()
		select.select_textobject(query, query_group)
	end, { desc = "Select " .. query })
end

local moves = {
	["ff"] = { "goto_next_start", "@function.outer" },
	["]F"] = { "goto_next_end", "@function.outer" },
	["]["] = { "goto_next_end", "@class.outer" },
	["FF"] = { "goto_previous_start", "@function.outer" },
	["[["] = { "goto_previous_start", "@class.outer" },
	["[F"] = { "goto_previous_end", "@function.outer" },
	["[]"] = { "goto_previous_end", "@class.outer" },
	["]c"] = { "goto_next", "@conditional.outer" },
	["[c"] = { "goto_previous", "@conditional.outer" },
}

for key, move_config in pairs(moves) do
	local action = move_config[1]
	local query = move_config[2]
	vim.keymap.set({ "n", "x", "o" }, key, function()
		move[action](query, "textobjects")
	end, { desc = "Move to " .. query })
end

require("treesitter-context").setup({
	max_lines = 1,
})
