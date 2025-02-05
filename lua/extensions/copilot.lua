return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        -- event = "BufReadPost",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = false,
                    -- enabled = not vim.g.ai_cmp,
                    auto_trigger = false,
                    -- hide_during_completion = vim.g.ai_cmp,
                    keymap = {
                        accept = false, -- handled by nvim-cmp / blink.cmp
                        next = "<M-]>",
                        prev = "<M-[>",
                    },
                },
                panel = { enabled = false },
                filetypes = {
                    markdown = true,
                    help = true,
                },
            })
            vim.cmd("Copilot disable") -- disable copilot by default
        end,
        keys = {
            { "<leader>ac", ":Copilot ", desc = "ai: [c]opilot" },
        },
    },
    { "giuxtaposition/blink-cmp-copilot" },
    {
        "zbirenbaum/copilot.lua",
        opts = function()
            LazyVim.cmp.actions.ai_accept = function()
                if require("copilot.suggestion").is_visible() then
                    LazyVim.create_undo()
                    require("copilot.suggestion").accept()
                    return true
                end
            end
        end,
    },
    {
        "saghen/blink.cmp",
        optional = true,
        dependencies = { "giuxtaposition/blink-cmp-copilot" },
        opts = {
            sources = {
                default = { "copilot" },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        kind = "Copilot",
                        score_offset = 100,
                        async = true,
                    },
                },
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        optional = true,
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(
                opts.sections.lualine_x,
                2,
                {
                    function()
                        local clients = package.loaded["copilot"]
                                and LazyVim.lsp.get_clients({ name = "copilot", bufnr = 0 })
                            or {}
                        if #clients > 0 then
                            local status = require("copilot.api").status.data.status
                            local stat = ""
                            if status == "InProgress" and "pending" then
                                stat = "pending"
                            elseif status == "" or "ok" or "Normal" then
                                stat = "on"
                            elseif status == "Warning" and "error" then
                                stat = "warning"
                            end
                            return "ai:" .. stat
                            -- return "[ai:" .. stat .. "]"
                        end
                        return ""
                    end,
                    color = function()
                        return { fg = "Special" }
                    end,
                }
                -- LazyVim.lualine.status("ai", function()
                -- LazyVim.lualine.status(LazyVim.config.icons.kinds.Copilot, function()
                --     local clients = package.loaded["copilot"]
                --             and LazyVim.lsp.get_clients({ name = "copilot", bufnr = 0 })
                --         or {}
                --     if #clients > 0 then
                --         local status = require("copilot.api").status.data.status
                --         return (status == "InProgress" and "pending") or (status == "Warning" and "error") or "ok"
                --     end
                -- end)
            )
        end,
    },
}
