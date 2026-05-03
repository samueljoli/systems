local status_ok, octo = pcall(require, "octo")

if not status_ok then
	return
end

octo.setup({})

-- Keymaps
vim.keymap.set("n", "<leader>gi", "<cmd>Octo issue list<CR>", { noremap = true, desc = "Open Octo issue list" })
