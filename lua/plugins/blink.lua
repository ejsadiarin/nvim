return {
    "saghen/blink.cmp",
    -- build = "...", -- needs cargo
    -- lazy = false,
    version = not vim.g.lazyvim_blink_main and "*",
    build = vim.g.lazyvim_blink_main and "cargo build --release",
    opts_extend = {
        "sources.completion.enabled_providers",
        "sources.compat",
        "sources.default",
    },
    dependencies = {
        "rafamadriz/friendly-snippets",
        {
            "saghen/blink.compat",
            optional = true, -- make optional so it's only enabled if any extras need it
            opts = {},
            version = not vim.g.lazyvim_blink_main and "*",
        },
    },
    event = "InsertEnter",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- HACK: this is commented out for codecompanion.nvim to work with blink properly
        -- enabled = function()
        --     return not vim.tbl_contains({}, vim.bo.filetype)
        --         and vim.bo.buftype ~= "nofile"
        --         and vim.bo.buftype ~= "prompt"
        --         and vim.b.completion ~= "false"
        -- end,
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "mono",
        },
        completion = {
            menu = {
                enabled = true,
                border = "rounded",
                winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                -- winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = { border = "rounded" },
            },
        },
        cmdline = {
            enabled = false,
            sources = {},
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
        snippets = {
            preset = "luasnip",
            expand = function(snippet)
                return LazyVim.cmp.expand(snippet)
            end,
            active = function(filter)
                return vim.snippet.active(filter)
            end,
            jump = function(direction)
                vim.snippet.jump(direction)
            end,
        },
        signature = {
            ---@type boolean
            enabled = false,
            window = { border = "rounded" },
        },
        sources = {
            ---@type table
            default = { "lsp", "path", "snippets", "buffer" },
            -- per_filetype = {
            --     sql = { "snippets", "dadbod", "buffer" },
            -- },
            -- providers = {
            --     dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
            -- },
            -- default = { "lsp", "path", "snippets", "buffer", "codecompanion" },
            -- default = { "codecompanion" },
            -- providers = {
            --     codecompanion = {
            --         name = "CodeCompanion",
            --         module = "codecompanion.providers.completion.blink",
            --         enabled = true,
            --     },
            -- },
            -- default = function()
            --     if pcall(require, "codecompanion") then
            --         return { "lsp", "path", "snippets", "buffer", "codecompanion" } -- do i want ai completion?
            --     else
            --         return { "lsp", "path", "snippets", "buffer" }
            --     end
            -- end,
        },
        keymap = {
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<A-m>"] = { "hide", "fallback" },
            ["<A-e>"] = { "hide", "fallback" },
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
            ["<C-k>"] = { "scroll_documentation_up", "fallback" },
            ["<C-j>"] = { "scroll_documentation_down", "fallback" },
            ["<C-up>"] = { "scroll_documentation_up", "fallback" },
            ["<C-down>"] = { "scroll_documentation_down", "fallback" },
        },
    },
    -- opts_extend = {
    --     "sources.completion.enabled_providers",
    --     "sources.compat",
    --     "sources.default",
    -- },
}
