return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        theme = "gruvbox-dark",
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { function()
                local cwd = vim.fn.getcwd()
                local path = vim.fn.expand("%")

                local result = path
                if string.sub(result, 1, 6) == "oil://" then
                    result = string.sub(result, 7)
                end

                if string.sub(result, 1, #cwd) == cwd and #result > #cwd then
                    result = string.sub(result, #cwd + 1)
                    if string.sub(result, 1, 1) == "/" then
                        result = string.sub(result, 2)
                    end
                end
                return result ~= "" and result or cwd
            end },
            lualine_x = { "lsp_status" },
            lualine_y = { "filetype" },
            lualine_z = { "location" },
        }
    }
}
