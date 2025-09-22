return {
    -- Jinja syntax highlighting (if needed)
    { "lepture/vim-jinja", ft = { "jinja", "sql", "dbt" } },

    -- Ensure Treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "sql", "yaml", "markdown" })
        end,
    },

    -- Ensure LSP servers for SQL and YAML
    {
        "mason-org/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "sqls", "yamlls" })
        end,
    },

    -- Optional: Keymaps to run dbt commands
    {
        "folke/which-key.nvim",
        opts = function(_, opts)
            opts.defaults["<leader>db"] = { name = "+dbt" }
        end,
        config = function()
            vim.keymap.set("n", "<leader>dbr", ":!dbt run<CR>", { desc = "dbt run" })
            vim.keymap.set("n", "<leader>dbt", ":!dbt test<CR>", { desc = "dbt test" })
            vim.keymap.set("n", "<leader>dbm", ":!dbt model <cword><CR>", { desc = "dbt model under cursor" })
        end,
    },
}
