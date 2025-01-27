return {
    {
        "3rd/image.nvim",
        -- build = false,
        event = "VeryLazy",
        opts = {
            backend = "kitty",
            processor = "magick_rock", -- or "magick_cli"
            -- rocks = {
            --     hererocks = true,
            -- },
        },
    },
}
