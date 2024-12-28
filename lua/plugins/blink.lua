return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "mono",
        },
        completion = {
            menu = {
                border = "rounded",
                winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = { border = "rounded" },
            },
        },
        signature = {
            enabled = true,
            window = { border = "rounded" },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            cmdline = {},
            -- uncomment if want
            -- cmdline = function()
            --     local type = vim.fn.getcmdtype()
            --     -- search forward & backward
            --     if type == "/" or type == "?" then
            --         return { "buffer" }
            --     end
            --     -- commands
            --     if type == ":" then
            --         return { "cmdline" }
            --     end
            --     return {}
            -- end,
        },
        keymap = {
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide", "fallback" },
            ["<CR>"] = { "accept", "fallback" },

            -- ["<Tab>"] = {
            --     function(cmp)
            --         return cmp.select_next()
            --     end,
            --     "snippet_forward",
            --     "fallback",
            -- },
            -- ["<S-Tab>"] = {
            --     function(cmp)
            --         return cmp.select_prev()
            --     end,
            --     "snippet_backward",
            --     "fallback",
            -- },

            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-up>"] = { "scroll_documentation_up", "fallback" },
            ["<C-down>"] = { "scroll_documentation_down", "fallback" },
        },
    },
}
