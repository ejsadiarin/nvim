return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            -- make sure mason installs the server
            servers = {
                yamlls = {
                    -- Have to add this for yamlls to understand that we support line folding
                    capabilities = {
                        textDocument = {
                            foldingRange = {
                                dynamicRegistration = false,
                                lineFoldingOnly = true,
                            },
                        },
                    },
                    -- lazy-load schemastore when needed
                    on_new_config = function(new_config)
                        new_config.settings.yaml.schemas = vim.tbl_deep_extend(
                            "force",
                            new_config.settings.yaml.schemas or {},
                            require("schemastore").yaml.schemas()
                        )
                    end,
                    settings = {
                        redhat = { telemetry = { enabled = false } },
                        yaml = {
                            keyOrdering = false,
                            format = {
                                enable = true,
                            },
                            validate = true,
                            schemaStore = {
                                -- Must disable built-in schemaStore support to use
                                -- schemas from SchemaStore.nvim plugin
                                -- enable = false,
                                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                                -- url = "",
                                -- on enable use this:
                                enable = true,
                                url = "https://www.schemastore.org/api/json/catalog.json",
                            },
                            schemas = {
                                kubernetes = "*.yaml",
                                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                                ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "azure-pipelines*.{yml,yaml}",
                                ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] = "roles/tasks/*.{yml,yaml}",
                                ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = "*play*.{yml,yaml}",
                                ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                                ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                                ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
                                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
                                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*compose*.{yml,yaml}",
                                ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
                            },
                        },
                    },
                },
                -- yamlls = {
                --     -- Have to add this for yamlls to understand that we support line folding
                --     capabilities = {
                --         textDocument = {
                --             foldingRange = {
                --                 dynamicRegistration = false,
                --                 lineFoldingOnly = true,
                --             },
                --         },
                --     },
                --     -- lazy-load schemastore when needed
                --     on_new_config = function(new_config)
                --         new_config.settings.yaml.schemas = vim.tbl_deep_extend(
                --             "force",
                --             new_config.settings.yaml.schemas or {},
                --             require("schemastore").yaml.schemas()
                --         )
                --     end,
                --     settings = {
                --         redhat = { telemetry = { enabled = false } },
                --         yaml = {
                --             keyOrdering = false,
                --             format = {
                --                 enable = true,
                --             },
                --             validate = true,
                --             schemaStore = {
                --                 -- Must disable built-in schemaStore support to use
                --                 -- schemas from SchemaStore.nvim plugin
                --                 -- enable = false,
                --                 -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                --                 -- url = "",
                --                 -- on enable use this:
                --                 enable = true,
                --                 url = "https://www.schemastore.org/api/json/catalog.json",
                --             },
                --         },
                --     },
                -- },
                jsonls = {
                    -- lazy-load schemastore when needed
                    on_new_config = function(new_config)
                        new_config.settings.json.schemas = new_config.settings.json.schemas or {}
                        vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
                    end,
                    settings = {
                        json = {
                            format = {
                                enable = true,
                            },
                            validate = { enable = true },
                        },
                    },
                },
            },
            setup = {
                yamlls = function()
                    -- Neovim < 0.10 does not have dynamic registration for formatting
                    if vim.fn.has("nvim-0.10") == 0 then
                        LazyVim.lsp.on_attach(function(client, _)
                            client.server_capabilities.documentFormattingProvider = true
                        end, "yamlls")
                    end
                end,
            },
        },
    },

    -- YAML-related plugins
    {
        "b0o/SchemaStore.nvim",
        lazy = true,
        version = false, -- last release is way too old
        -- config = function()
        --     require("lspconfig").yamlls.setup({
        --         settings = {
        --             yaml = {
        --                 schemaStore = {
        --                     -- You must disable built-in schemaStore support if you want to use
        --                     -- this plugin and its advanced options like `ignore`.
        --                     enable = false,
        --                     -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        --                     url = "",
        --                 },
        --                 schemas = require("schemastore").yaml.schemas(),
        --             },
        --         },
        --     })
        --     require("lspconfig").jsonls.setup({
        --         settings = {
        --             json = {
        --                 schemas = require("schemastore").json.schemas(),
        --                 validate = { enable = true },
        --             },
        --         },
        --     })
        -- end,
    },

    {
        "someone-stole-my-name/yaml-companion.nvim",
        ft = { "yaml", "yml" },
        opts = {
            -- Built in file matchers
            builtin_matchers = {
                -- Detects Kubernetes files based on content
                kubernetes = { enabled = true },
                cloud_init = { enabled = true },
            },
            -- Additional schemas available in Telescope picker
            schemas = {
                --{
                --name = "Kubernetes 1.22.4",
                --uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.4-standalone-strict/all.json",
                --},
            },
            -- Pass any additional options that will be merged in the final LSP config
            lspconfig = {
                cmd = { "yaml-language-server" },
                flags = {
                    debounce_text_changes = 150,
                },
                settings = {
                    redhat = { telemetry = { enabled = false } },
                    yaml = {
                        validate = true,
                        format = { enable = true },
                        hover = true,
                        schemaStore = {
                            enable = true,
                            url = "https://www.schemastore.org/api/json/catalog.json",
                        },
                        schemaDownload = { enable = true },
                        schemas = {},
                        trace = { server = "debug" },
                    },
                },
            },
        },
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "nvim-lua/plenary.nvim" },
            -- { "nvim-telescope/telescope.nvim" },
        },
        keys = {
            {
                "<leader>ey",
                function()
                    require("yaml-companion").open_ui_select()
                end,
                desc = "YAML schema select",
            },
        },
        -- config = function()
        --     require("telescope").load_extension("yaml_schema")
        -- end,
    },

    -- ANSIBLE
    {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "ansible-lint" } },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                ansiblels = {},
            },
        },
    },
    {
        "mfussenegger/nvim-ansible",
        ft = { "yaml", "yml" },
        keys = {
            {
                "<leader>tA",
                function()
                    require("ansible").run()
                end,
                desc = "Ansible Run Playbook/Role",
                silent = true,
            },
        },
    },
    -- JSON
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "json5" } },
    },
    -- Kubernetes, Helm, etc.
    {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "kube-linter" } },
    },
    { "towolf/vim-helm", ft = "helm" },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "helm" } },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                helm_ls = {},
            },
            setup = {
                yamlls = function()
                    LazyVim.lsp.on_attach(function(client, buffer)
                        if vim.bo[buffer].filetype == "helm" then
                            vim.schedule(function()
                                vim.cmd("LspStop ++force yamlls")
                            end)
                        end
                    end, "yamlls")
                end,
            },
        },
    },

    -- CICD
    {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "actionlint" } },
    },

    -- Formatting
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile", "InsertLeave" },
        opts = {
            formatters = {
                shfmt = {
                    prepend_args = { "-i", "2" }, -- 2 spaces instead of tab
                },
                stylua = {
                    prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" }, -- 4 spaces instead of tab
                },
                yamlfmt = {
                    prepend_args = {
                        "-formatter",
                        "indent=2,include_document_start=true,retain_line_breaks_single=true",
                    },
                },
            },
            -- format_on_save = function()
            --     -- Disable with a global variable
            --     if not vim.g.autoformat then
            --         return
            --     end
            --     return { async = false, timeout_ms = 500, lsp_fallback = false }
            -- end,
            -- log_level = vim.log.levels.TRACE,
            formatters_by_ft = {
                go = { "goimports", "gofmt" },
                javascript = { "prettier" },
                json = { "prettier" },
                lua = { "stylua" },
                ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
                ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
                python = { "isort", "ruff_format" },
                sh = { "shfmt" },
                terraform = { "terraform_fmt" },
                ["terraform-vars"] = { "terraform_fmt" },
                tex = { "latexindent" },
                toml = { "taplo" },
                typst = { "typstfmt" },
                yaml = { "yamlfmt" },
            },
        },
    },

    {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "yamlfmt", "taplo", "terraform-ls" } },
    },
}
