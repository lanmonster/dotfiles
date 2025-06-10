return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
		"L3MON4D3/LuaSnip",
		"j-hui/fidget.nvim",
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local lspconfig = require("lspconfig")
		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
			},
			automatic_installation = true,
			handlers = {
				function(server_name) -- default handler (optional)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["denols"] = function()
					lspconfig.denols.setup({
						capabilities = capabilities,
						root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
					})
				end,
				["ts_ls"] = function()
					lspconfig.ts_ls.setup({
						capabilities = capabilities,
						root_dir = function(fname)
							-- This will use tsserver unless a deno config is present
							local util = lspconfig.util
							return not util.root_pattern("deno.json", "deno.jsonc")(fname)
								and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
						end,
						single_file_support = false, -- must set to false
					})
				end,
				["ruff"] = function()
					lspconfig.ruff.setup({
						init_options = {
							settings = {
								configurationPreference = "filesystemFirst",
								configuration = vim.fn.getcwd() .. "/ruff.toml",
							},
						},
					})
				end,
				["pylsp"] = function()
					lspconfig.pylsp.setup({
						capabilities = capabilities,
						settings = {
							pylsp = {
								plugins = {
									pycodestyle = { enabled = false },
								},
							},
						},
						on_attach = function(client, bufnr)
							client.config.settings = {
								pylsp = {
									plugins = {
										pycodestyle = {
											enabled = false,
										},
									},
								},
							}
							client.notify("workspace/didChangeConfiguration", {
								settings = client.config.settings,
							})
						end,
					})
				end,
			},
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			virtual_lines = true,
			underline = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})
	end,
}
