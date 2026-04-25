local status_ok, achitek = pcall(require, "achitek")

if not status_ok then
	vim.notify("Failed to load achitek", vim.log.levels.ERROR)
end

achitek.setup({
	treesitter = {
		enabled = false,
	},
})
