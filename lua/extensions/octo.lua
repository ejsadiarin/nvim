return {
    {
        "pwntester/octo.nvim",
        config = function()
            require("octo").setup({
                picker = "snacks", -- or "fzf-lua" or "telescope"
                picker_config = {
                    use_emojis = false, -- only used by "fzf-lua" picker for now
                    mappings = { -- mappings for the pickers
                        open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
                        copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
                        checkout_pr = { lhs = "<C-o>", desc = "checkout pull request" },
                        merge_pr = { lhs = "<C-r>", desc = "merge pull request" },
                    },
                    snacks = { -- snacks specific config
                        actions = { -- custom actions for specific snacks pickers (array of tables)
                            issues = { -- actions for the issues picker
                                -- { name = "my_issue_action", fn = function(picker, item) print("Issue action:", vim.inspect(item)) end, lhs = "<leader>a", desc = "My custom issue action" },
                            },
                            pull_requests = { -- actions for the pull requests picker
                                -- { name = "my_pr_action", fn = function(picker, item) print("PR action:", vim.inspect(item)) end, lhs = "<leader>b", desc = "My custom PR action" },
                            },
                            notifications = {}, -- actions for the notifications picker
                            issue_templates = {}, -- actions for the issue templates picker
                            search = {}, -- actions for the search picker
                            -- ... add actions for other pickers as needed
                        },
                    },
                },
            })
        end,
    },
}
