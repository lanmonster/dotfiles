return {
	"allaman/emoji.nvim",
	version = "1.0.0", -- optionally pin to a tag
	ft = { "markdown", "lua", "javascript", "typescript" }, -- adjust to your needs
	lazy = false,
	dependencies = {
		-- util for handling paths
		"nvim-lua/plenary.nvim",
		-- optional for nvim-cmp integration
		-- "hrsh7th/nvim-cmp",
		-- optional for telescope integration
		"nvim-telescope/telescope.nvim",
		-- -- optional for fzf-lua integration via vim.ui.select
		-- "ibhagwan/fzf-lua",
	},
	config = function(_, opts)
		require("emoji").setup(opts)
		local ts = require("telescope").load_extension("emoji")
		vim.keymap.set("n", "<leader>se", ts.emoji, { desc = "[S]earch [E]moji" })
	end,
}
