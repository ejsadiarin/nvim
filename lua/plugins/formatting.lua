return {
    -- Formatting
    -- {
    --     "stevearc/conform.nvim",
    --     event = { "BufReadPre", "BufNewFile", "InsertLeave" },
    --     opts = {
    --         formatters = {
    --             shfmt = {
    --                 prepend_args = { "-i", "2" }, -- 2 spaces instead of tab
    --             },
    --             stylua = {
    --                 prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" }, -- 4 spaces instead of tab
    --             },
    --             yamlfmt = {
    --                 prepend_args = {
    --                     "-formatter",
    --                     "indent=2,include_document_start=false,retain_line_breaks_single=true,line_ending=lf,sequence_style=block,mapping-style=block",
    --                 },
    --             },
    --         },
    --         format_on_save = function()
    --             -- Disable with a global variable
    --             if not vim.g.autoformat then
    --                 return
    --             end
    --             return { async = false, timeout_ms = 500, lsp_fallback = false }
    --         end,
    --         log_level = vim.log.levels.TRACE,
    --         formatters_by_ft = {
    --             go = { "gofumpt", "goimports" },
    --             javascript = { "prettier" },
    --             javascriptreact = { "prettier" },
    --             typescript = { "prettier" },
    --             typescriptreact = { "prettier" },
    --             json = { "prettier" },
    --             lua = { "stylua" },
    --             ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
    --             ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
    --             python = { "isort", "ruff_format" },
    --             sh = { "shfmt" },
    --             terraform = { "terraform_fmt" },
    --             ["terraform-vars"] = { "terraform_fmt" },
    --             tex = { "latexindent" },
    --             toml = { "taplo" },
    --             typst = { "typstfmt" },
    --             yaml = { "yamlfmt" },
    --         },
    --     },
    -- },

    {
        "stevearc/conform.nvim",
        dependencies = { "mason.nvim" },
        lazy = true,
        cmd = "ConformInfo",
        keys = {
            {
                "<leader>cF",
                function()
                    require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
                end,
                mode = { "n", "x" },
                desc = "Format Injected Langs",
            },
        },
        init = function()
            -- Install the conform formatter on VeryLazy
            LazyVim.on_very_lazy(function()
                LazyVim.format.register({
                    name = "conform.nvim",
                    priority = 100,
                    primary = true,
                    format = function(buf)
                        require("conform").format({ bufnr = buf })
                    end,
                    sources = function(buf)
                        local ret = require("conform").list_formatters(buf)
                        ---@param v conform.FormatterInfo
                        return vim.tbl_map(function(v)
                            return v.name
                        end, ret)
                    end,
                })
            end)
        end,
        opts = function()
            ---@type conform.setupOpts
            local opts = {
                default_format_opts = {
                    timeout_ms = 500,
                    async = false, -- not recommended to change
                    quiet = false, -- not recommended to change
                    lsp_format = "fallback", -- not recommended to change
                },
                log_level = vim.log.levels.DEBUG,
                formatters_by_ft = {
                    go = { "gofumpt", "goimports" },
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
                    typescript = { "prettier", "prettierd", stop_after_first = true },
                    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
                    json = { "prettierd", "prettier", stop_after_first = true },
                    lua = { "stylua" },
                    ["markdown"] = { "prettierd", "markdownlint-cli2", "markdown-toc" },
                    ["markdown.mdx"] = { "prettierd", "markdownlint-cli2", "markdown-toc" },
                    python = { "isort", "ruff_format" },
                    sh = { "shfmt" },
                    terraform = { "terraform_fmt" },
                    ["terraform-vars"] = { "terraform_fmt" },
                    tex = { "latexindent" },
                    toml = { "taplo" },
                    typst = { "typstfmt" },
                    yaml = { "yamlfmt" },
                    c = { "clang-format" },
                    cpp = { "clang-format" },
                },
                -- format_on_save = function()
                --     -- Disable with a global variable
                --     if not vim.g.autoformat then
                --         return
                --     end
                --     return { async = false, timeout_ms = 500, lsp_fallback = false }
                -- end,
                -- The options you set here will be merged with the builtin formatters.
                -- You can also define any custom formatters here.
                ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
                formatters = {
                    injected = {
                        options = {
                            ignore_errors = true,
                            lang_to_ext = {
                                typescript = "ts",
                                javascript = "js",
                                bash = "sh",
                                c_sharp = "cs",
                                elixir = "exs",
                                julia = "jl",
                                latex = "tex",
                                markdown = "md",
                                python = "py",
                                ruby = "rb",
                                rust = "rs",
                                teal = "tl",
                            },
                        },
                    },
                    -- # Example of using dprint only when a dprint.json file is present
                    -- dprint = {
                    --   condition = function(ctx)
                    --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
                    --   end,
                    -- },
                    --
                    -- # Example of using shfmt with extra args
                    -- shfmt = {
                    --   prepend_args = { "-i", "2", "-ci" },
                    -- },
                    shfmt = {
                        prepend_args = { "-i", "2", "-ci" }, -- 2 spaces instead of tab
                    },
                    stylua = {
                        prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" }, -- 4 spaces instead of tab
                    },
                    yamlfmt = {
                        prepend_args = {
                            "-formatter",
                            "indent=2,include_document_start=false,retain_line_breaks_single=true,line_ending=lf,sequence_style=block,mapping-style=block",
                        },
                    },
                    ["clang-format"] = {
                        prepend_args = { "--style={IndentWidth: 4, ContinuationIndentWidth: 4}" },
                    },
                    prettier = {
                        command = require("conform.util").find_executable({
                            "node_modules/.bin/prettier",
                        }, "prettier"),
                        args = { "--tab-width", "4", "--config-precedence", "prefer-file", "--stdin-filepath", "$FILENAME" },
                    },
                    prettierd = {
                        args = { "--tab-width", "4", "--config-precedence", "prefer-file", "--stdin-filepath", "$FILENAME" },
                    },
                },
            }
            return opts
        end,
    },
}
