return {
    {
        "nvim-telescope/telescope.nvim",

        tag = "0.1.5",

        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local telescope = require("telescope")
            telescope.setup({})
            telescope.load_extension("emoji")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pt", "<cmd>Telescope<CR>")
            vim.keymap.set("n", "<leader>pe", "<cmd>Telescope emoji<CR>")
            vim.keymap.set("n", "<leader>ph", builtin.help_tags)
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            vim.keymap.set("n", "<leader>pgf", builtin.git_files, {})
            vim.keymap.set("n", "<leader>pgs", builtin.git_status, {})
            vim.keymap.set("n", "<leader>pws", function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set("n", "<leader>pWs", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set("n", "<leader>ps", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)
            vim.keymap.set("v", "<leader>ps", builtin.grep_string)
        end,
    },
    {
        "xiyaowong/telescope-emoji.nvim",
    }
}
