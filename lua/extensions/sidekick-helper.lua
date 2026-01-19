-- NOTE: this sidekick-helper file is complementary to LazyVim's sidekick implementation module (enabled in init.lua)
-- Added custom keybindings and cli.mux.backend = "tmux"

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sidekick_terminal" },
    callback = function(event)
        vim.keymap.set("t", "kj", "<C-\\><C-n>", { desc = "Exit terminal mode", silent = true, buffer = event.buf })
        -- Ensure <Esc> sends a literal escape to the terminal (for cancelling prompts)
        vim.keymap.set("t", "<Esc>", "<Esc>", { buffer = event.buf, nowait = true })
    end,
})

-- vim.keymap.set("t", "<Esc>", "<nop>", { desc = "No Exit terminal mode", silent = true })

---@param opts? { filter?: sidekick.cli.Filter }
local function sidekick_cli_kill(opts)
    local Cli = require("sidekick.cli")
    local State = require("sidekick.cli.state")
    local Util = require("sidekick.util")

    ---@param state sidekick.cli.State
    local function kill(state)
        if not state then
            return
        end
        State.detach(state)
        if state.session and state.session.mux_session then
            if state.session.backend == "tmux" or state.session.mux_backend == "tmux" then
                Util.exec({ "tmux", "kill-session", "-t", state.session.mux_session })
            end
        end
    end

    opts = opts or {}
    Cli.select({
        auto = true,
        filter = Util.merge(opts.filter, { started = true }),
        cb = kill,
    })
end

return {
    {
        "folke/sidekick.nvim",
        opts = {
            -- add any options here
            cli = {
                win = {
                    -- stylua: ignore
                    keys = {
                        buffers       = { "<c-b>", "buffers"   , mode = "nt", desc = "open buffer picker" },
                        files         = { "<c-z>", "files"     , mode = "nt", desc = "open file picker" },
                        hide_n        = { "q"    , "hide"      , mode = "n" , desc = "hide the terminal window" },
                        hide_ctrl_backslash   = { "<c-\\>", "hide"      , mode = "nt" , desc = "hide the terminal window" },
                        -- hide_ctrl_dot = { "<c-.>", "hide"      , mode = "nt", desc = "hide the terminal window" },
                        -- hide_ctrl_q   = { "<c-q>", "hide"      , mode = "nt" , desc = "hide the terminal window" },
                        -- hide_ctrl_z   = { "<c-z>", "hide"      , mode = "nt", desc = "hide the terminal window" },
                        prompt        = { "<c-y>", "prompt"    , mode = "t" , desc = "insert prompt or context" },
                        -- The line below was mapping <Esc> to exit terminal insert mode. It is now disabled.
                        -- stopinsert    = { "<c-[>", "stopinsert", mode = "t" , desc = "enter normal mode" },
                        -- navigations 
                        nav_left_alt       = { "<m-h>", "nav_left"  , expr = true, desc = "navigate to the left window" },
                        nav_left_ctrl      = { "<c-h>", "nav_left"  , expr = true, desc = "navigate to the left window" },
                    },
                    layout = "float",
                    float = {
                        row = 0,
                        col = 0,
                        width = vim.o.columns,
                        height = vim.o.lines - 2,
                    },
                    -- stylua: ignore end
                },
                mux = {
                    backend = "tmux",
                    enabled = true,
                },
            },
            nes = { enabled = false },
        },
        keys = {
            -- {
            --     "<tab>",
            --     function()
            --         -- if there is a next edit, jump to it, otherwise apply it if any
            --         if not require("sidekick").nes_jump_or_apply() then
            --             return "<Tab>" -- fallback to normal tab
            --         end
            --     end,
            --     expr = true,
            --     desc = "Goto/Apply Next Edit Suggestion",
            -- },
            {
                "<c-\\>",
                function()
                    require("sidekick.cli").toggle()
                end,
                desc = "Sidekick Toggle",
                mode = { "n", "t", "x" },
                nowait = true,
            },
            {
                "<leader>aa",
                function()
                    require("sidekick.cli").toggle()
                end,
                desc = "Sidekick Toggle CLI",
            },

            -- NOTE: custom aa on visual mode (faster send)
            {
                "<leader>aa",
                function()
                    require("sidekick.cli").send({ msg = "{this}" })
                end,
                mode = { "x" },
                desc = "Sidekick: send selection",
            },

            {
                "<leader>as",
                function()
                    require("sidekick.cli").select()
                end,
                -- Or to select only installed tools:
                -- require("sidekick.cli").select({ filter = { installed = true } })
                desc = "Select CLI",
            },
            {
                "<leader>ad",
                function()
                    require("sidekick.cli").close()
                end,
                desc = "Detach a CLI Session",
            },
            {
                "<leader>at",
                function()
                    require("sidekick.cli").send({ msg = "{this}" })
                end,
                mode = { "x", "n" },
                desc = "Send This",
            },
            {
                "<leader>af",
                function()
                    require("sidekick.cli").send({ msg = "{file}" })
                end,
                desc = "Send File",
            },
            {
                "<leader>av",
                function()
                    require("sidekick.cli").send({ msg = "{selection}" })
                end,
                mode = { "x" },
                desc = "Send Visual Selection",
            },
            {
                "<leader>ap",
                function()
                    require("sidekick.cli").prompt()
                end,
                mode = { "n", "x" },
                desc = "Sidekick Select Prompt",
            },
            { "<leader>ak", sidekick_cli_kill, desc = "Kill (Sidekick)" },
        },
    },
}
