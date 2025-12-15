return {
    -- yaml schema support
    {
        "b0o/SchemaStore.nvim",
        lazy = true,
        version = false, -- last release is way too old
    },

    -- correctly setup lspconfig
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
                                enable = false,
                                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                                url = "",
                            },
                            -- see schema more catalogs here: https://github.com/datreeio/CRDs-catalog (https://raw.githubusercontent.com/datreeio/CRDs-catalog/main)
                            schemas = vim.tbl_deep_extend("force", require("schemastore").yaml.schemas(), {
                                kubernetes = "*.yaml",
                                ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
                                ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
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
                                ["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
                                ["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = {
                                    "docker-compose*.{yml,yaml}",
                                    -- "compose.{yml,yaml}",
                                },
                                ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] = {
                                    "argocd*.{yml,yaml}",
                                    "applications/*.{yml,yaml}",
                                    "apps/*.{yml,yaml}",
                                    "app.{yml,yaml}",
                                },
                                ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/argoproj.io/applicationset_v1alpha1.json"] = {
                                    "applicationsets/*.{yml,yaml}",
                                    "appsets/*.{yml,yaml}",
                                    "argocd-appset.{yml,yaml}",
                                },
                            }),
                        },
                    },
                },
            },
        },
    },

    -- YAML-related plugins
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
    -- CICD
    {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "actionlint" } },
    },

    {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "yamlfmt", "taplo", "terraform-ls" } },
    },
}

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
--                 enable = false,
--                 -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
--                 url = "",
--                 -- on enable use this:
--                 -- enable = true,
--                 -- url = "https://www.schemastore.org/api/json/catalog.json",
--             },
--             schemas = {
--                 kubernetes = "*.yaml",
--                 ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
--                 ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
--                 ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
--                 ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
--                 ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "azure-pipelines*.{yml,yaml}",
--                 ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] = "roles/tasks/*.{yml,yaml}",
--                 ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = "*play*.{yml,yaml}",
--                 ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
--                 ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
--                 ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
--                 ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
--                 ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
--                 ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
--                 ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*compose*.{yml,yaml}",
--                 ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
--                 ["https://raw.githubusercontent.com/argoproj/argo-cd/master/schema/application.json"] = {
--                     "argocd*.{yml,yaml}",
--                     "applications/*.{yml,yaml}",
--                 },
--                 ["https://json.schemastore.org/argocd-project"] = {
--                     "projects/*.{yml,yaml}",
--                     "argocd-project*.{yml,yaml}",
--                 },
--                 ["https://json.schemastore.org/argocd-applicationset"] = {
--                     "applicationsets/*.{yml,yaml}",
--                     "argocd-appset*.{yml,yaml}",
--                 },
--             },
--         },
--     },
-- },
