return {
	{
		"stevearc/oil.nvim",
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name)
					return name == ".."
				end,
			},
			columns = {
				"icon",
				"size",
			},
		},
	},
}
