local yazi = require("yazi")

vim.keymap.set("n", "<leader>e", yazi.yazi, { desc = "Open the file manager" })

yazi.setup()
