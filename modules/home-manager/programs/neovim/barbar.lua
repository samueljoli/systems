local status_ok, barbar = pcall(require, "barbar")

if not status_ok then
	return
end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

barbar.setup({
	animation = false,
})

-- Pin/unpin buffer
map("n", "<leader>p", "<Cmd>BufferPin<CR>", opts)

-- Close buffer
map("n", "<leader>c", "<Cmd>BufferClose<CR>", opts)

-- Magic buffer-picking mode
map("n", "<leader>b", "<Cmd>BufferPick<CR>", opts)
map("n", "<C-s-p>", "<Cmd>BufferPickDelete<CR>", opts)

-- Sort automatically by...
map("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bn", "<Cmd>BufferOrderByName<CR>", opts)
map("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
