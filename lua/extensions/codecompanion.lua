local copilot_fn = function()
    local copilot_config = {
        -- env = { api_key = "GITHUB_TOKEN" }, -- see github/copilot.vim for details
    }
    return require("codecompanion.adapters").extend("copilot", copilot_config)
end

local anthropic_fn = function()
    local anthropic_config = {
        env = { api_key = "ANTHROPIC_API_KEY" },
    }
    return require("codecompanion.adapters").extend("anthropic", anthropic_config)
end

local openai_fn = function()
    local openai_config = {
        env = { api_key = "OPENAI_API_KEY" },
    }
    return require("codecompanion.adapters").extend("openai", openai_config)
end

local gemini_fn = function()
    local gemini_config = {
        env = { api_key = "GEMINI_API_KEY" },
        schema = {
            model = {
                default = "gemini-2.0-flash-thinking-exp",
            },
        },
    }
    return require("codecompanion.adapters").extend("gemini", gemini_config)
end

local deepseek_fn = function()
    local deepseek_config = {
        env = { api_key = "DEEPSEEK_API_KEY" }, -- api_key = "cmd: pass show keys/deepseek | head -n 1",
        -- schema = {
        --   model = {
        --     default = "deepseek-reasoner",
        --   },
        -- },
    }
    return require("codecompanion.adapters").extend("deepseek", deepseek_config)
end

--- Ollama config for CodeCompanion.
local ollama_fn = function()
    return require("codecompanion.adapters").extend("ollama", {
        schema = {
            model = {
                default = "deepseek-r1:7b",
                -- default = "llama3.1:7b",
                -- default = "codellama:7b",
            },
            num_ctx = {
                default = 16384,
            },
            num_predict = {
                default = -1,
            },
        },
    })
end

local supported_adapters = {
    copilot = copilot_fn,
    anthropic = anthropic_fn,
    openai = openai_fn,
    gemini = gemini_fn,
    deepseek = deepseek_fn,
    ollama = ollama_fn,
}

local function save_path()
    local Path = require("plenary.path")
    local p = Path:new(vim.fn.stdpath("data") .. "/codecompanion_chats")
    p:mkdir({ parents = true })
    return p
end

-- TODO: make this work kekw (see: https://github.com/fredrikaverpil/dotfiles/blob/main/nvim-fredrik/lua/fredrik/plugins/codecompanion.lua#L192 and https://gist.github.com/itsfrank/942780f88472a14c9cbb3169012a3328)
--- Load a saved codecompanion.nvim chat file into a new CodeCompanion chat buffer.
--- Usage: CodeCompanionLoad
vim.api.nvim_create_user_command("CodeCompanionLoad", function()
    local snacks_picker = require("snacks.picker")

    local function select_adapter(filepath)
        local adapters = vim.tbl_keys(supported_adapters)

        ---@diagnostic disable-next-line: missing-parameter
        snacks_picker.select(adapters, {
            prompt = "Select CodeCompanion Adapter> ",
        }, function(selected)
            local adapter = selected[1]
            -- Open new CodeCompanion chat with selected adapter
            vim.cmd("CodeCompanionChat " .. adapter)

            -- Read contents of saved chat file
            local lines = vim.fn.readfile(filepath)

            -- Get the current buffer (which should be the new CodeCompanion chat)
            local current_buf = vim.api.nvim_get_current_buf()

            -- Paste contents into the new chat buffer
            vim.api.nvim_buf_set_lines(current_buf, 0, -1, false, lines)
        end)
    end

    local function start_picker()
        local files = vim.fn.glob(save_path() .. "/*", false, true)

        ---@diagnostic disable-next-line: missing-parameter
        snacks_picker.select(files, {
            prompt = "Saved CodeCompanion Chats | <c-r>: remove >",
            action = function(selected)
                if #selected > 0 then
                    local filepath = selected[1]
                    select_adapter(filepath)
                end
            end,
            additional_actions = {
                ["ctrl-r"] = function(selected)
                    if #selected > 0 then
                        local filepath = selected[1]
                        os.remove(filepath)
                        -- Refresh the picker
                        start_picker()
                    end
                end,
            },
        }, function(selected)
            if #selected > 0 then
                local filepath = selected[1]
                select_adapter(filepath)
            end
        end)
    end

    start_picker()
end, {})

--- Save the current codecompanion.nvim chat buffer to a file in the save_folder.
--- Usage: CodeCompanionSave <filename>.md
---@param opts table
vim.api.nvim_create_user_command("CodeCompanionSave", function(opts)
    local codecompanion = require("codecompanion")
    local success, chat = pcall(function()
        return codecompanion.buf_get_chat(0)
    end)
    if not success or chat == nil then
        vim.notify("CodeCompanionSave should only be called from CodeCompanion chat buffers", vim.log.levels.ERROR)
        return
    end
    if #opts.fargs == 0 then
        vim.notify("CodeCompanionSave requires at least 1 arg to make a file name", vim.log.levels.ERROR)
    end
    local save_name = table.concat(opts.fargs, "-") .. ".md"
    local save_file = save_path():joinpath(save_name)
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    save_file:write(table.concat(lines, "\n"), "w")
end, { nargs = "*" })

return {
    {
        "olimorris/codecompanion.nvim",
        lazy = false,
        -- event = "VeryLazy",
        -- cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionCmd", "CodeCompanionActions" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- "github/copilot.vim",
            {
                "saghen/blink.cmp",
                lazy = false,
                opts = {
                    keymap = {
                        preset = "enter",
                        -- ["<S-Tab>"] = { "select_prev", "fallback" },
                        -- ["<Tab>"] = { "select_next", "fallback" },
                    },
                    sources = {
                        default = { "lsp", "path", "snippets", "buffer", "codecompanion" },
                        providers = {
                            codecompanion = {
                                name = "CodeCompanion",
                                module = "codecompanion.providers.completion.blink",
                                enabled = true,
                            },
                        },
                        cmdline = {}, -- Disable sources for command-line mode
                        -- compat = { "codecompanion" },
                    },
                },
                opts_extend = {
                    -- "sources.completion.enabled_providers",
                    -- "sources.compat",
                    "sources.default",
                },
            },
        },
        keys = function()
            vim.keymap.set("n", "<leader>aa", "<CMD>CodeCompanionChat Toggle<CR>", { desc = "ai: ch[a]t" })
            vim.keymap.set("n", "<leader>ac", "<CMD>CodeCompanionCmd<CR>", { desc = "ai: [c]md" })
            vim.keymap.set("n", "<leader>as", "<CMD>CodeCompanionActions<CR>", { desc = "ai: action[s]" })
            vim.keymap.set(
                { "n", "v" },
                "<leader>ae",
                "<CMD>CodeCompanion<CR>",
                { desc = "ai: [f]ile write with diff" }
            )
            vim.keymap.set("n", "<leader>fa", function()
                local chats = vim.fn.stdpath("data") .. "/codecompanion_chats"
                Snacks.picker.files({
                    cwd = chats,
                })
            end, { desc = "find previous ch[a]t files" })
        end,
        opts = {
            strategies = {
                -- adapter = "anthropic" | "copilot" | "deepseek" | "gemini" | "huggingface" | "openai" | "ollama"
                chat = {
                    adapter = "copilot",
                    -- keymaps = {
                    --     send = {
                    --         modes = { n = "<C-s>", i = "<C-s>" },
                    --     },
                    --     close = {
                    --         modes = { n = "<C-c>", i = "<C-c>" },
                    --     },
                    -- },
                    slash_commands = {
                        ["file"] = {
                            callback = "strategies.chat.slash_commands.file",
                            description = "Select a file with Snacks",
                            opts = {
                                provider = LazyVim.pick.want(),
                                -- provider = "snacks", -- Other options include 'default', 'mini_pick', 'fzf_lua', 'snacks'
                                -- contains_code = true,
                            },
                        },
                        ["buffer"] = {
                            opts = {
                                provider = LazyVim.pick.want(),
                            },
                        },
                        ["help"] = {
                            opts = {
                                provider = LazyVim.pick.want(),
                                -- provider = "snacks", -- telescope|mini_pick|fzf_lua
                            },
                        },
                        ["symbols"] = {
                            opts = {
                                provider = LazyVim.pick.want(),
                                -- provider = "snacks", -- default|telescope|mini_pick|fzf_lua
                            },
                        },
                    },
                },
                inline = { adapter = "copilot" },
                agent = { adapter = "copilot" },
            },
            display = {
                action_palette = {
                    width = 95,
                    height = 10,
                    prompt = "Prompt ", -- Prompt used for interactive LLM calls
                    provider = "default", -- default|telescope|mini_pick
                    opts = {
                        show_default_actions = true, -- Show the default actions in the action palette?
                        show_default_prompt_library = true, -- Show the default prompt library in the action palette?
                    },
                },
                chat = {
                    show_settings = true,
                },
                diff = { provider = "default" },
            },
            adapters = supported_adapters,
            prompt_library = {
                ["Code Expert"] = {
                    strategy = "chat",
                    description = "Get some special advice from an LLM",
                    opts = {
                        mapping = "<leader>ce",
                        modes = { "v" },
                        short_name = "expert",
                        auto_submit = true,
                        stop_context_insertion = true,
                        user_prompt = true,
                    },
                    prompts = {
                        {
                            role = "system",
                            content = function(context)
                                return "I want you to act as a senior "
                                    .. context.filetype
                                    .. " developer. I will ask you specific questions and I want you to return concise explanations and codeblock examples."
                            end,
                        },
                        {
                            role = "user",
                            content = function(context)
                                local text = require("codecompanion.helpers.actions").get_code(
                                    context.start_line,
                                    context.end_line
                                )

                                return "I have the following code:\n\n```"
                                    .. context.filetype
                                    .. "\n"
                                    .. text
                                    .. "\n```\n\n"
                            end,
                            opts = {
                                contains_code = true,
                            },
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            require("codecompanion").setup(opts)
        end,
    },
}
