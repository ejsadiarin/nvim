return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- set this if you want to always pull the latest change
        opts = {
            ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
            provider = "copilot",
            auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
            -- copilot = {},
            openai = {
                --- DEEPSEEK (needs top-up balance) ---
                endpoint = "https://api.deepseek.com",
                model = "deepseek-chat", -- options: "deepseek-reasoning", "deepseek-chat"
                timeout = 30000, -- Timeout in milliseconds
                temperature = 0,
                max_tokens = 4096,
                -- optional
                api_key_name = "DEEPSEEK_API_KEY", -- default OPENAI_API_KEY if not set
            },
            claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-3-5-sonnet-20241022",
                temperature = 0,
                max_tokens = 4096,
                api_key_name = "ANTHROPIC_API_KEY",
            },
            hints = { enabled = false },
            suggestion = {
                debounce = 600,
                throttle = 600,
            },
        },
        -- keys = {
        --     { "<leader>aa", function() require("avante.api").ask() end, desc = "avante: [a]sk", },
        --     { "<leader>ee", "<CMD>AvanteToggle<CR>", desc = "toggle avant[e]" },
        -- },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            -- "zbirenbaum/copilot.lua", -- for providers='copilot'
            -- {
            --     -- support for image pasting
            --     "HakonHarnes/img-clip.nvim",
            --     event = "VeryLazy",
            --     opts = {
            --         -- recommended settings
            --         default = {
            --             embed_image_as_base64 = false,
            --             prompt_for_file_name = false,
            --             drag_and_drop = {
            --                 insert_mode = true,
            --             },
            --             -- required for Windows users
            --             use_absolute_path = true,
            --         },
            --     },
            -- },
            -- {
            --     -- Make sure to set this up properly if you have lazy=true
            --     "MeanderingProgrammer/render-markdown.nvim",
            --     opts = {
            --         file_types = { "markdown", "Avante" },
            --     },
            --     ft = { "markdown", "Avante" },
            -- },
        },
    },
}
