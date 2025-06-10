vim.g.mapleader = " "
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>ex", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>mp", vim.cmd.Glow)
vim.keymap.set("n", "<leader>qp", function()
	vim.diagnostic.setqflist({ bufnr = 0 })
end)
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-b>", "<cmd>cclose<CR>")
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
local is_diff_open = false
vim.keymap.set("n", "<leader>dv", function()
	if is_diff_open then
		vim.cmd.DiffviewClose()
	else
		vim.cmd.DiffviewOpen()
	end
	is_diff_open = not is_diff_open
end)
vim.api.nvim_create_user_command("Q", function(opts)
	if opts.bang then
		vim.cmd("qa!")
	else
		vim.cmd.qa()
	end
end, { bang = true })
vim.keymap.set("n", "<leader>f", function()
	require("pear").jump_pair()
end, { silent = true })
