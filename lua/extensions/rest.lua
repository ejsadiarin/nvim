-- NOTE: this plugin needs luarocks and lua-5.1/lua5.1 (compat-lua)
return {
    {
        "rest-nvim/rest.nvim",
        ft = { "http", "rest" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                opts.ensure_installed = opts.ensure_installed or {}
                table.insert(opts.ensure_installed, "http")
            end,
        },
    },
}
