return {
    {
        "mistweaverco/kulala.nvim",
        ft = { "http", "rest" },
        opts = {
            -- your configuration comes here
            global_keymaps = true,
        },
        keys = {
            { "<leader>Rs", desc = "Send request" },
            { "<leader>Ra", desc = "Send all requests" },
            { "<leader>Rb", desc = "Open scratchpad" },
        },
    },
}
