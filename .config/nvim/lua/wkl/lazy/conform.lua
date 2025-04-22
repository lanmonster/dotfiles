return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            svelte = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
            lua = { "stylua" },
            python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
            toml = { "taplo" },
        },
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        },
    },
}
