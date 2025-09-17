return {
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        event = "LazyFile",
        dependencies = {
            "mason.nvim",
            { "mason-org/mason-lspconfig.nvim", config = function() end },
        },
        opts = function(_, opts)
            ---@class PluginLspOpts
            return vim.tbl_deep_extend("force", opts, {
                -- options for vim.diagnostic.config()
                ---@type vim.diagnostic.Opts
                diagnostics = {
                    underline = true,
                    update_in_insert = false,
                    virtual_text = {
                        spacing = 4,
                        source = "if_many",
                        prefix = "●",
                        -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
                        -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
                        -- prefix = "icons",
                    },
                    severity_sort = true,
                    signs = {
                        text = {
                            [vim.diagnostic.severity.ERROR] = "E",
                            [vim.diagnostic.severity.WARN] = "W",
                            [vim.diagnostic.severity.HINT] = "H",
                            [vim.diagnostic.severity.INFO] = "I",
                            -- [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
                            -- [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
                            -- [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
                            -- [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
                        },
                        numhl = {
                            [vim.diagnostic.severity.WARN] = "WarningMsg",
                            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
                            [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
                            [vim.diagnostic.severity.HINT] = "DiagnosticHint",
                        },
                    },
                },
                -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
                -- Be aware that you also will need to properly configure your LSP server to
                -- provide the inlay hints.
                inlay_hints = {
                    enabled = false, -- disable by default (toggle with <leader>uh)
                    exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
                },
                -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
                -- Be aware that you also will need to properly configure your LSP server to
                -- provide the code lenses.
                codelens = {
                    enabled = false,
                },
                -- add any global capabilities here
                capabilities = {
                    workspace = {
                        fileOperations = {
                            didRename = true,
                            willRename = true,
                        },
                    },
                },
                -- options for vim.lsp.buf.format
                -- `bufnr` and `filter` is handled by the LazyVim formatter,
                -- but can be also overridden when specified
                format = {
                    formatting_options = nil,
                    timeout_ms = nil,
                },
                -- LSP Server Settings
                ---@type lspconfig.options
                servers = {
                    lua_ls = {
                        -- mason = false, -- set to false if you don't want this server to be installed with mason
                        -- Use this to add any additional keymaps
                        -- for specific lsp servers
                        -- ---@type LazyKeysSpec[]
                        -- keys = {},
                        settings = {
                            Lua = {
                                workspace = {
                                    checkThirdParty = false,
                                },
                                codeLens = {
                                    enable = true,
                                },
                                completion = {
                                    callSnippet = "Replace",
                                },
                                doc = {
                                    privateName = { "^_" },
                                },
                                hint = {
                                    enable = true,
                                    setType = false,
                                    paramType = true,
                                    paramName = "Disable",
                                    semicolon = "Disable",
                                    arrayIndex = "Disable",
                                },
                            },
                        },
                    },
                    jdtls = {
                        handlers = {
                            ["$/progress"] = function(_, result, ctx) end,
                        },
                    },
                    gopls = {
                        settings = {
                            gopls = {
                                gofumpt = true,
                                codelenses = {
                                    gc_details = false,
                                    generate = true,
                                    regenerate_cgo = true,
                                    run_govulncheck = true,
                                    test = true,
                                    tidy = true,
                                    upgrade_dependency = true,
                                    vendor = true,
                                },
                                hints = {
                                    assignVariableTypes = true,
                                    compositeLiteralFields = true,
                                    compositeLiteralTypes = true,
                                    constantValues = true,
                                    functionTypeParameters = true,
                                    parameterNames = true,
                                    rangeVariableTypes = true,
                                },
                                analyses = {
                                    nilness = true,
                                    unusedparams = true,
                                    unusedwrite = true,
                                    useany = true,
                                },
                                usePlaceholders = true,
                                completeUnimported = true,
                                staticcheck = true,
                                directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                                semanticTokens = true,
                            },
                        },
                    },
                    marksman = {
                        format = false,
                    },
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
                            },
                        },
                    },
                },
                -- you can do any additional lsp server setup here
                -- return true if you don't want this server to be setup with lspconfig
                ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
                setup = {
                    -- example to setup with typescript.nvim
                    -- tsserver = function(_, opts)
                    --   require("typescript").setup({ server = opts })
                    --   return true
                    -- end,
                    -- Specify * to use this function as a fallback for any server
                    -- ["*"] = function(server, opts) end,
                    --
                },
            })
            -- return ret
        end,
        ---@param opts PluginLspOpts
        config = function(_, opts)
            -- remap lsp keymaps (if LazyVim installed)
            if pcall(require, "lazyvim") then
                local keys = require("lazyvim.plugins.lsp.keymaps").get()
                keys[#keys + 1] = { "gy", false }
                keys[#keys + 1] = { "<leader>D", vim.lsp.buf.type_definition, desc = "Goto Type [D]efinition" }
            end

            -- setup autoformat
            LazyVim.format.register(LazyVim.lsp.formatter())

            -- setup keymaps
            LazyVim.lsp.on_attach(function(client, buffer)
                require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
            end)

            LazyVim.lsp.setup()
            LazyVim.lsp.on_dynamic_capability(require("lazyvim.plugins.lsp.keymaps").on_attach)

            -- inlay hints
            if opts.inlay_hints.enabled then
                LazyVim.lsp.on_supports_method("textDocument/inlayHint", function(client, buffer)
                    if
                        vim.api.nvim_buf_is_valid(buffer)
                        and vim.bo[buffer].buftype == ""
                        and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
                    then
                        vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
                    end
                end)
            end

            -- folds
            if opts.folds.enabled then
                LazyVim.lsp.on_supports_method("textDocument/foldingRange", function(client, buffer)
                    local win = vim.api.nvim_get_current_win()
                    vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
                end)
            end

            -- code lens
            if opts.codelens.enabled and vim.lsp.codelens then
                LazyVim.lsp.on_supports_method("textDocument/codeLens", function(client, buffer)
                    vim.lsp.codelens.refresh()
                    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                        buffer = buffer,
                        callback = vim.lsp.codelens.refresh,
                    })
                end)
            end

            -- diagnostics
            if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
                opts.diagnostics.virtual_text.prefix = function(diagnostic)
                    local icons = LazyVim.config.icons.diagnostics
                    for d, icon in pairs(icons) do
                        if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
                            return icon
                        end
                    end
                    return "●"
                end
            end
            vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

            if opts.capabilities then
                vim.lsp.config("*", { capabilities = opts.capabilities })
            end

            -- get all the servers that are available through mason-lspconfig
            local have_mason = LazyVim.has("mason-lspconfig.nvim")
            local mason_all = have_mason
                    and vim.tbl_keys(require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package)
                or {} --[[ @as string[] ]]

            local exclude_automatic_enable = {} ---@type string[]

            local function configure(server)
                local server_opts = opts.servers[server] or {}

                local setup = opts.setup[server] or opts.setup["*"]
                if setup and setup(server, server_opts) then
                    return true -- lsp will be setup by the setup function
                end

                vim.lsp.config(server, server_opts)

                -- manually enable if mason=false or if this is a server that cannot be installed with mason-lspconfig
                if server_opts.mason == false or not vim.tbl_contains(mason_all, server) then
                    vim.lsp.enable(server)
                    return true
                end
                return false
            end

            local ensure_installed = {} ---@type string[]
            for server, server_opts in pairs(opts.servers) do
                server_opts = server_opts == true and {} or server_opts or false
                if server_opts and server_opts.enabled ~= false then
                    -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
                    if configure(server) then
                        exclude_automatic_enable[#exclude_automatic_enable + 1] = server
                    else
                        ensure_installed[#ensure_installed + 1] = server
                    end
                else
                    exclude_automatic_enable[#exclude_automatic_enable + 1] = server
                end
            end

            if have_mason then
                require("mason-lspconfig").setup({
                    ensure_installed = vim.tbl_deep_extend(
                        "force",
                        ensure_installed,
                        LazyVim.opts("mason-lspconfig.nvim").ensure_installed or {}
                    ),
                    automatic_enable = {
                        exclude = exclude_automatic_enable,
                    },
                })
            end

            if vim.lsp.is_enabled("denols") and vim.lsp.is_enabled("vtsls") then
                ---@param server string
                local resolve = function(server)
                    local markers, root_dir = vim.lsp.config[server].root_markers, vim.lsp.config[server].root_dir
                    vim.lsp.config(server, {
                        root_dir = function(bufnr, on_dir)
                            local is_deno = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) ~= nil
                            if is_deno == (server == "denols") then
                                if root_dir then
                                    return root_dir(bufnr, on_dir)
                                elseif type(markers) == "table" then
                                    local root = vim.fs.root(bufnr, markers)
                                    return root and on_dir(root)
                                end
                            end
                        end,
                    })
                end
                resolve("denols")
                resolve("vtsls")
            end
        end,
    },

    -- cmdline tools and lsp servers
    {

        "mason-org/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        opts_extend = { "ensure_installed" },
        opts = {
            ensure_installed = {
                "stylua",
                "shfmt",
            },
        },
        ---@param opts MasonSettings | {ensure_installed: string[]}
        config = function(_, opts)
            require("mason").setup(opts)
            local mr = require("mason-registry")
            mr:on("package:install:success", function()
                vim.defer_fn(function()
                    -- trigger FileType event to possibly load this newly installed LSP server
                    require("lazy.core.handler.event").trigger({
                        event = "FileType",
                        buf = vim.api.nvim_get_current_buf(),
                    })
                end, 100)
            end)

            mr.refresh(function()
                for _, tool in ipairs(opts.ensure_installed) do
                    local p = mr.get_package(tool)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end)
        end,
    },
}
