local status_ok, todo = pcall(require, "todo-comments")

if not status_ok then
	return
end

todo.setup({
	keywords = {
		FIX = {
			icon = " ", -- icon used for the sign, and in search results
			color = "error", -- can be a hex color, or a named color (see below)
			alt = { "FIXME", "BUG", "FIXIT", "ERROR" }, -- a set of other keywords that all map to this FIX keywords
		},
		TODO = {
			alt = { "INSTRUMENT", "DOCS", "EXAMPLE" },
		},
		LEARN = {
			icon = "🧠",
			color = "#FF0065",
		},
	},
})
