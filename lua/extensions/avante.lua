-- NOTE: I only use avante for inline editing (not inline suggestions) and inline asking (no sidebar chat)
-- Workflow: Visual mode select input -> feed through avante (edit or ask)
return {
    {
        "yetone/avante.nvim",
        build = vim.fn.has("win32") ~= 0
                and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        event = "VeryLazy",
        version = false, -- set this if you want to always pull the latest change
        opts = {
            -- instructions_file = "avante.md", -- deprecated or optional
            ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
            provider = "copilot", -- Use copilot as the default provider
            auto_suggestions_provider = nil, -- Explicitly disable auto-suggestions provider

            behaviour = {
                auto_suggestions = false, -- Disable auto-suggestions (inline completions)
                auto_set_keymaps = false, -- Disable default global keymaps (conflicts with codecompanion's <leader>aa)
                auto_set_highlight_group = true,
                auto_apply_diff_after_generation = false,
                support_paste_from_clipboard = false,
            },

            providers = {
                copilot = {}, -- Uses zbirenbaum/copilot.lua
                claude = {
                    endpoint = "https://api.anthropic.com",
                    model = "claude-3-5-sonnet-20241022",
                    extra_request_body = {
                        max_tokens = 4096,
                        temperature = 0,
                    },
                    api_key_name = "ANTHROPIC_API_KEY",
                },
                gemini = {
                    endpoint = "https://generativelanguage.googleapis.com/v1beta/models", -- Correct endpoint for Google's API if needed, but avante might handle the base URL
                    model = "gemini-1.5-pro",
                    timeout = 30000,
                    extra_request_body = {
                        max_tokens = 4096,
                        temperature = 0.7,
                    },
                    api_key_name = "GEMINI_API_KEY",
                },
            },

            -- Customize mappings to remove chat-related global defaults if they exist within the plugin's internal handling,
            -- effectively disabling the chat UI's easy access.
            mappings = {
                -- Keep useful internal mappings for the edit/diff windows
                diff = {
                    ours = "co",
                    theirs = "ct",
                    all_theirs = "ca",
                    both = "cb",
                    cursor = "cc",
                    next = "]x",
                    prev = "[x",
                },
                suggestion = {
                    accept = "<M-l>",
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
                jump = {
                    next = "]]",
                    prev = "[[",
                },
                submit = {
                    normal = "<CR>",
                    insert = "<C-s>",
                },
            },

            hints = { enabled = false },
            selection = { enabled = false },
            windows = {
                wrap = true, -- similar to soft wrap
                width = 30, -- default % based on available width
                sidebar_header = {
                    align = "center", -- left, center, right for title
                    rounded = true,
                },
            },
        },
        keys = {
            -- Only map the visual edit command.
            -- No mappings for toggling the chat sidebar (<leader>aa, <leader>ee removed).

            {
                "<leader>ae",
                function()
                    require("avante.api").edit()
                end,
                mode = { "v", "n" },
                desc = "avante: [e]dit (inline)",
            },
        },
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "folke/snacks.nvim",
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        use_absolute_path = true,
                    },
                },
            },
        },
    },
}
