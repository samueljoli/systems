local status_ok, neotest = pcall(require, "neotest")

if not status_ok then
	return
end

neotest.setup({
	adapters = {
		require("rustaceanvim.neotest"),
	},
})

vim.keymap.set("n", "<leader>'", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run [T]est [F]ile" })

vim.keymap.set("n", "<leader>tl", function()
	require("neotest").run.run_last()
end, { desc = "Run Last Test" })

vim.keymap.set("n", "<leader>;", function()
	require("neotest").run.run()
end, { desc = "Run [T]est [N]earest" })

vim.keymap.set("n", "<leader>Twf", function()
	require("neotest").watch.watch(vim.fn.expand("%"))
end, { desc = "Run [T]est [W]atch [F]ile" })

-- vim.keymap.set("n", "<leader>rf", function()
-- 	vim.ui.input({ prompt = "Enter feature flags: " }, function(input)
-- 		if input and input ~= "" then
-- 			require("neotest").run.run({ extra_args = { "--features", input } })
-- 		else
-- 			require("neotest").run.run()
-- 		end
-- 	end)
-- end, { noremap = true, desc = "Run test with custom feature flags" })
