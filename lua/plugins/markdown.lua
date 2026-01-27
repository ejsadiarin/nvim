return {
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters = {
                ["prettier"] = {
                    prepend_args = { "--tab-width", "2", "--use-tabs", "false" },
                },
                ["markdown-toc"] = {
                    condition = function(_, ctx)
                        for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
                            if line:find("<!%-%- toc %-%->") then
                                return true
                            end
                        end
                    end,
                },
                ["markdownlint-cli2"] = {
                    condition = function(_, ctx)
                        local diag = vim.tbl_filter(function(d)
                            return d.source == "markdownlint"
                        end, vim.diagnostic.get(ctx.buf))
                        return #diag > 0
                    end,
                },
            },
            formatters_by_ft = {
                -- ["markdown"] = {},
                -- ["markdown.mdx"] = {},
                ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
                ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
            },
        },
    },

    {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "markdownlint-cli2", "markdown-toc" } },
    },

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown", "md" },
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = function()
            require("lazy").load({ plugins = { "markdown-preview.nvim" } })
            vim.fn["mkdp#util#install"]()
        end,
        keys = {
            {
                "<leader>cP",
                ft = "markdown",
                "<cmd>MarkdownPreviewToggle<cr>",
                desc = "Markdown Preview",
            },
        },
        config = function()
            vim.cmd([[do FileType]])
        end,
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            -- Code blocks
            code = {
                enabled = true,
                sign = false,
                style = "full",
                width = "block",
                left_pad = 1,
                right_pad = 1,
                border = "thin",
                above = "▄",
                below = "▀",
            },
            -- Headings with icons
            heading = {
                enabled = true,
                sign = false,
                icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
                width = "full",
            },
            -- Checkboxes with icons
            checkbox = {
                enabled = true,
                unchecked = { icon = "󰄱 " },
                checked = { icon = "󰄵 " },
                custom = {
                    todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
                    important = { raw = "[!]", rendered = "󰀨 ", highlight = "DiagnosticWarn" },
                    question = { raw = "[?]", rendered = "󰘥 ", highlight = "DiagnosticInfo" },
                    star = { raw = "[*]", rendered = "󰓎 ", highlight = "DiagnosticHint" },
                },
            },
            -- Bullet points
            bullet = {
                enabled = true,
                icons = { "●", "○", "◆", "◇" },
                right_pad = 1,
            },
            -- Block quotes
            quote = {
                enabled = true,
                icon = "▎",
                repeat_linebreak = true,
            },
            -- Horizontal rules
            dash = {
                enabled = true,
                icon = "─",
                width = "full",
            },
            -- Links
            link = {
                enabled = true,
                footnote = { superscript = true },
                image = "󰥶 ",
                email = "󰀓 ",
                hyperlink = "󰌹 ",
            },
            -- Tables
            pipe_table = {
                enabled = true,
                style = "full",
                cell = "padded",
            },
        },
        ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
        config = function(_, opts)
            require("render-markdown").setup(opts)

            -- Treesitter heading highlights
            vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = "#9d7cd8", bold = true })

            -- Render-markdown heading highlights
            vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = "#9d7cd8", bold = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = "#9d7cd8", bold = true })

            -- Bold & Italic
            vim.api.nvim_set_hl(0, "@markup.strong", { fg = "#f5a742", bold = true })
            vim.api.nvim_set_hl(0, "@markup.strong.markdown_inline", { fg = "#f5a742", bold = true })
            vim.api.nvim_set_hl(0, "@markup.italic", { fg = "#e5c07b", italic = true })
            vim.api.nvim_set_hl(0, "@markup.italic.markdown_inline", { fg = "#e5c07b", italic = true })

            -- Code blocks
            vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#1f1f1f" })
            vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { fg = "#f9cc6c", bg = "#24283b", bold = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownCodeBorder", { fg = "#565f89" })

            -- Lists & Bullets
            vim.api.nvim_set_hl(0, "@markup.list.markdown", { fg = "#f9cc6c" })
            vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = "#f9cc6c" })

            -- Checkboxes
            vim.api.nvim_set_hl(0, "RenderMarkdownUnchecked", { fg = "#565f89" })
            vim.api.nvim_set_hl(0, "RenderMarkdownChecked", { fg = "#73daca" })
            vim.api.nvim_set_hl(0, "RenderMarkdownTodo", { fg = "#e0af68" })

            -- Quotes & Dash
            vim.api.nvim_set_hl(0, "RenderMarkdownQuote", { fg = "#565f89" })
            vim.api.nvim_set_hl(0, "RenderMarkdownDash", { fg = "#565f89" })

            -- Links (all treesitter link-related highlights)
            vim.api.nvim_set_hl(0, "@markup.strikethrough", { fg = "#565f89", strikethrough = true })
            vim.api.nvim_set_hl(0, "@markup.link", { fg = "#7aa2f7", underline = true })
            vim.api.nvim_set_hl(0, "@markup.link.markdown_inline", { fg = "#7aa2f7", underline = true })
            vim.api.nvim_set_hl(0, "@markup.link.label", { fg = "#7aa2f7", underline = true })
            vim.api.nvim_set_hl(0, "@markup.link.label.markdown_inline", { fg = "#7aa2f7", underline = true })
            vim.api.nvim_set_hl(0, "@markup.link.url", { fg = "#565f89", italic = true })
            vim.api.nvim_set_hl(0, "@markup.raw", { fg = "#73daca" })
            vim.api.nvim_set_hl(0, "@string.special.url", { fg = "#565f89", italic = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownLink", { fg = "#7aa2f7", underline = true })

            -- Tables
            vim.api.nvim_set_hl(0, "RenderMarkdownTableHead", { fg = "#7aa2f7", bold = true })
            vim.api.nvim_set_hl(0, "RenderMarkdownTableRow", { fg = "#c0caf5" })
            vim.api.nvim_set_hl(0, "RenderMarkdownTableFill", { fg = "#565f89" })

            Snacks.toggle({
                name = "Render Markdown",
                get = function()
                    return require("render-markdown.state").enabled
                end,
                set = function(enabled)
                    local m = require("render-markdown")
                    if enabled then
                        m.enable()
                    else
                        m.disable()
                    end
                end,
            }):map("<leader>um")
        end,
    },

    -- if preferred, then uncomment
    -- {
    --     "OXY2DEV/markview.nvim",
    --     ft = { "markdown", "md" },
    --     opts = {},
    --     keys = {
    --         { "<leader>um", "<CMD>Markview<CR>", desc = "[m]arkdown Preview" },
    --     },
    -- },
}
