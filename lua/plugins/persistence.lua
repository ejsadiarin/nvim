return {
    -- Session management. This saves your session in the background,
    -- keeping track of open buffers, window arrangement, and more.
    -- You can restore sessions when returning through the dashboard.
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
        -- stylua: ignore
        keys = {
          { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
        },
    },
}
