return {
    {
        "yetone/avante.nvim",
        build = vim.fn.has("win32") ~= 0
                and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make BUILD_FROM_SOURCE=true",
        event = "VeryLazy",
        version = false, -- set this if you want to always pull the latest change
        opts = {
            instructions_file = "avante.md",
            ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
            provider = "copilot",
            auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
            providers = {
                -- copilot = {},
                -- openai = {
                --     --- DEEPSEEK (needs top-up balance) ---
                --     endpoint = "https://api.deepseek.com",
                --     model = "deepseek-chat", -- options: "deepseek-reasoning", "deepseek-chat"
                --     timeout = 30000, -- Timeout in milliseconds
                --     extra_request_body = {
                --         max_tokens = 4096,
                --         temperature = 0,
                --     },
                --     -- optional
                --     api_key_name = "DEEPSEEK_API_KEY", -- default OPENAI_API_KEY if not set
                -- },
                claude = {
                    endpoint = "https://api.anthropic.com",
                    model = "claude-sonnet-4.5",
                    extra_request_body = {
                        max_tokens = 4096,
                        temperature = 0,
                    },
                    api_key_name = "ANTHROPIC_API_KEY",
                },
                gemini = {
                    endpoint = "https://api.gemini.com",
                    model = "gemini-2.5-pro",
                    timeout = 20000, -- Timeout in milliseconds
                    extra_request_body = {
                        max_tokens = 2048,
                        temperature = 0.7,
                    },
                    api_key_name = "GEMINI_API_KEY",
                },
            },
            hints = { enabled = false },
            suggestion = {
                debounce = 600,
                throttle = 600,
            },
        },
        keys = {
            {
                "<leader>aa",
                function()
                    require("avante.api").ask()
                end,
                desc = "avante: [a]sk",
            },
            { "<leader>ee", "<CMD>AvanteToggle<CR>", desc = "toggle avant[e]" },
        },
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "folke/snacks.nvim", -- for input provider snacks
            --- The below dependencies are optional,
            -- "nvim-tree/nvim-web-devicons", -- or nvim-mini/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
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
