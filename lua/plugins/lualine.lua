local function get_schema()
    local schema = require("yaml-companion").get_buf_schema(0)
    if schema.result[1].name == "none" then
        return ""
    end
    return schema.result[1].name
end

return {
    {
        "nvim-lualine/lualine.nvim",
        -- lazy = false,
        event = "VeryLazy",
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline till lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
        end,
        dependencies = {
            "someone-stole-my-name/yaml-companion.nvim",
        },
        opts = {
            extensions = {},
            -- extensions = { "neo-tree", "lazy", "fzf" },
            options = {
                theme = "auto", -- 'auto', 'catppuccin', 'tokyonight', 'gruvbox'
                icons_enabled = true,
                globalstatus = vim.o.laststatus == 3,
                disabled_filetypes = { statusline = { "dashboard", "alpha", "starter", "snacks_dashboard" } },
                section_separators = { left = "", right = "" },
                -- section_separators = { left = '', right = '' },
                -- component_separators = { left = "", right = " 󰇙 " },
                component_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = {
                    -- {
                    --     function()
                    --         if package.loaded['grapple'] and require('grapple').exists() then
                    --             return '󰛢 ' .. require('grapple').name_or_index()
                    --         end
                    --         return '󰛢 N'
                    --     end,
                    --     -- cond = function()
                    --     --   return package.loaded['grapple'] and require('grapple').exists()
                    --     -- end,
                    -- },

                    -- {
                    --   'mode',
                    --   -- {'branch', icon = ''} / {'branch', icon = {'', color={fg='green'}}}
                    --
                    --   -- icon position can also be set to the right side from table. Example:
                    --   -- {'branch', icon = {'', align='right', color={fg='green'}}}
                    --   icon = nil,
                    -- },
                },
                lualine_b = {
                    {
                        function()
                            if package.loaded["grapple"] and require("grapple").exists() then
                                return "󰛢 " .. require("grapple").name_or_index()
                                -- return "[ " .. require("grapple").name_or_index() .. " ]"
                            end
                            return "󰛢 N"
                            -- return "[ N ]"
                        end,
                        -- cond = function()
                        --   return package.loaded['grapple'] and require('grapple').exists()
                        -- end,
                    },
                    -- {
                    --     function()
                    --         require("lualine.components.branch.git_branch").init()
                    --         local branch = "G:" .. require("lualine.components.branch.git_branch").get_branch()
                    --         return branch ~= nil and branch or ""
                    --     end,
                    -- },
                    {
                        "branch",
                        -- color = { fg = "#e3a1c7" },
                        -- icons_enabled = false,
                        icon = { "Git:", align = "left", color = { fg = "#a6e3a1" } },
                        padding = { left = 1, right = 0 },
                    },
                },

                lualine_c = {
                    -- LazyVim.lualine.root_dir(),
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    {
                        "filename",
                        path = 4,
                        padding = { left = 1, right = 1 },
                        shorting_target = 20, -- Shortens path to leave 40 spaces in the window
                        -- for other components. (terrible name, any suggestions?)
                        symbols = {
                            modified = "[+]", -- Text to show when the file is modified.
                            readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
                            unnamed = "[No Name]", -- Text to show for unnamed buffers.
                            newfile = "[New]", -- Text to show for newly created file before first write
                        },
                        -- color = { fg = '#f9cc6c' },
                        color = { fg = "#f38ba8" },
                    },
                    -- { LazyVim.lualine.pretty_path() },
                    {
                        "diagnostics",
                        symbols = {
                            error = "E:",
                            warn = "W:",
                            info = "I:",
                            hint = "H:",
                            -- error = " ",
                            -- warn = " ",
                            -- info = " ",
                            -- hint = " ",
                        },
                        padding = { left = 1, right = 1 },
                    },
                },

                lualine_x = {
                    {
                        function()
                            return get_schema()
                        end,
                        padding = { left = 1, right = 1 },
                        -- optional condition to ensure yaml-companion is loaded
                        cond = function()
                            return require("yaml-companion") ~= nil
                        end,
                    },

                    {
                        "diff",
                        colored = true,
                        symbols = {
                            added = "+ ", -- added = " ",
                            modified = "~ ",
                            removed = "- ",
                            -- added = " ", -- added = " ",
                            -- modified = " ",
                            -- removed = " ",
                        },
                        source = function()
                            local gitsigns = vim.b.gitsigns_status_dict
                            if gitsigns then
                                return {
                                    added = gitsigns.added,
                                    modified = gitsigns.changed,
                                    removed = gitsigns.removed,
                                }
                            end
                        end,
                    },
                    { "filetype", icons_enabled = false, separator = "", padding = { left = 1, right = 0 } },
                    -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 1 } },
                },
                lualine_y = {
                    -- { "filetype", separator = "", icons_enabled = false, padding = { left = 0, right = 1 } },
                    -- { "filetype", separator = "", icons_enabled = false, padding = { left = 1, right = 1 } },
                    { "location", padding = { left = 1, right = 2 } },
                    { "progress", padding = { left = 0, right = 2 } },
                },
                lualine_z = {
                    -- { 'progress', padding = { left = 0, right = 1 } },
                },
            },
        },
    },
}
