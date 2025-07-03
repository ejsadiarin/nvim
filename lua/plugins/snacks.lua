-- local banned_messages = { "No information available" }
-- vim.notify = function(msg, ...)
--     for _, banned in ipairs(banned_messages) do
--         if msg == banned then
--             return
--         end
--     end
--     return require("snacks.notifier")(msg, ...)
-- end

return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            indent = { enabled = false },
            input = { enabled = false },
            scope = { enabled = true },
            scroll = { enabled = true },
            bigfile = { enabled = true },
            profiler = { enabled = true },
            image = {
                enabled = true,
                -- force = true,
                doc = {
                    enabled = true,
                    inline = false,
                    float = false,
                    max_width = 200,
                    max_height = 100,
                },
            },
            notifier = {
                enabled = true,
                timeout = 3000,
                style = "fancy",
                filter = function(n)
                    if n.msg == "No information available" then
                        return false
                    end
                    return true
                end,
            },
            quickfile = { enabled = true },
            scratch = {
                enabled = true,
                ft = "markdown",
                icon = nil,
            },
            statuscolumn = { enabled = false }, -- we set this in options.lua
            toggle = { map = LazyVim.safe_keymap_set },
            words = { enabled = true },
            picker = {
                enabled = true,
                sources = {
                    files = { hidden = true },
                    grep = { hidden = true },
                    explorer = { hidden = true },
                },
            },
            styles = {
                notification = {
                    wo = { wrap = true }, -- Wrap notifications
                    relative = "editor",
                },
                scratch = {
                    relative = "editor",
                    width = 70,
                    height = 20,
                    bo = { buftype = "", buflisted = false, bufhidden = "hide", swapfile = false },
                    minimal = true,
                    noautocmd = false,
                    -- position = "right",
                    zindex = 20,
                    wo = { winhighlight = "NormalFloat:Normal" },
                    border = "rounded",
                    title_pos = "center",
                    footer_pos = "center",
                },
            },
            dashboard = {
                preset = {
                    --                header = [[
                    --        ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
                    --        ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
                    --        ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
                    --        ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
                    --        ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
                    --        ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
                    -- ]],
                    -- stylua: ignore
                    header = [[
late at night i think of you.
]],
                -- stylua: ignore start
                ---@type snacks.dashboard.Item[]
                    keys = {
                        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                },
            },
        },
        keys = {
        -- stylua: ignore start
        { "<leader>n", false },
        { "<leader>ei", function() Snacks.image.hover() end, desc = "View Image", }, -- must disable opts.image.doc.inline and opts.image.doc.float
        { "<leader>i", function() Snacks.image.hover() end, desc = "View Image", }, -- must disable opts.image.doc.inline and opts.image.doc.float
        { "<leader>cs", function() Snacks.scratch() end, desc = "Spawn Scratch Buffer", },
        { "<leader>cS", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", },
        { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications", },
        { "<leader>bd", "<CMD>:bd<CR>", desc = "Buffer: [d]elete" },
        -- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Buffer: [d]elete" },
        { "<leader>gg", function() Snacks.lazygit( { cwd = LazyVim.root.git() }) end, desc = "Lazygit", },
        { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git [b]lame Line", },
        -- { "<leader>gb", "<CMD>Git blame_line<CR>", desc = "Git [b]lame Line", },
        { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", },
        { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History", },
        { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)", },
        { "<leader>cR", function() Snacks.rename() end, desc = "Rename File", },
        { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Notification [h]istory", },
        { "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications", },
        { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal", },
        { "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore", },
        { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", },
        { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", },
            -- stylua: ignore end
            {
                "<leader>j",
                function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        require("gitsigns").nav_hunk("prev")
                    end
                    -- Snacks.words.jump(-vim.v.count1)
                end,
                desc = "Prev git change (hunk)",
            },
            {
                "<leader>k",
                function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        require("gitsigns").nav_hunk("next")
                    end
                    -- Snacks.words.jump(-vim.v.count1)
                end,
                desc = "Next git change (hunk)",
            },
            {
                "<leader>N",
                desc = "Neovim News",
                function()
                    Snacks.win({
                        file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                        width = 0.6,
                        height = 0.6,
                        border = "rounded",
                        wo = {
                            spell = false,
                            wrap = false,
                            signcolumn = "yes",
                            statuscolumn = " ",
                            conceallevel = 3,
                        },
                    })
                end,
            },
        -- Snacks picker keymaps start
        -- stylua: ignore start
        -- {
        --     "<leader>,",
        --     "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
        --     desc = "Switch Buffer",
        -- },
        { "<leader>,", false },
        { "<leader>ff", false },
        { "<leader>fF", false },
        { "<leader>/", false },
        { "<leader>:", false },
        { "<leader><space>", false },
        -- { "<leader>/", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
        -- { "<leader><space>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
        { "<leader>f:", function() Snacks.picker.command_history() end, desc = "[:]Command History" },
        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "[b]uffers" },
        { "<leader>fc", LazyVim.pick.config_files(), desc = "Find [c]onfig File" },
        { "<leader>fd", LazyVim.pick("files"), desc = "Find [d]irectory Files (Root Dir)" },
        { "<leader>fe", LazyVim.pick("files", { root = false }), desc = "Find [e]very File (cwd)" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find [g]it Files (git-files)" },
        { "<leader>fr", LazyVim.pick("oldfiles"), desc = "[r]ecent Files" },
        { "<leader>fR", LazyVim.pick("oldfiles", { filter = { cwd = true }}), desc = "[R]ecent Files (cwd)" },
        -- git
        { "<leader>gc", function() Snacks.picker.git_branches() end, desc = "Git Log" },
        -- { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "[c]ommits" },
        { "<leader>gd", false },
        -- { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "[d]iff (hunks)" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "[s]tatus" },
        -- -- grep
        { "<leader>sg", LazyVim.pick("live_grep"), desc = "[g]rep (Root Dir)" },
        { "<leader>sG", LazyVim.pick("live_grep", { root = false }), desc = "[G]rep (cwd)" },
        { "<leader>sw", LazyVim.pick("grep_word"), desc = "Visual selection or [w]ord (Root Dir)", mode = { "n", "x" } },
        { "<leader>sW", LazyVim.pick("grep_word", { root = false }), desc = "Visual selection or [W]ord (cwd)", mode = { "n", "x" } },
        -- -- search
        { '<leader>s"', function() Snacks.picker.registers() end, desc = "registers" },
        { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "[a]utocmds" },
        { "<leader>sc", function() Snacks.picker.command_history() end, desc = "[c]ommand History" },
        { "<leader>sC", function() Snacks.picker.commands() end, desc = "[C]ommands" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "[d]iagnostics" },
        { "<leader>sh", function() Snacks.picker.help() end, desc = "[h]elp Pages" },
        { "<leader>sH", function() Snacks.picker.highlights() end, desc = "[H]ighlights" },
        { "<leader>sj", function() Snacks.picker.jumps() end, desc = "[j]umps" },
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "[k]eymaps" },
        { "<leader>sl", function() Snacks.picker.loclist() end, desc = "[l]ocation List" },
        { "<leader>sM", function() Snacks.picker.man() end, desc = "[M]an Pages" },
        { "<leader>sm", function() Snacks.picker.marks() end, desc = "[m]arks" },
        { "<leader>sR", function() Snacks.picker.resume() end, desc = "[R]esume" },
        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "[q]uickfix List" },
        { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "[C]olorschemes" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "[p]rojects" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols({ filter = LazyVim.config.kind_filter }) end, desc = "Goto [s]ymbol"},
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols({ filter = LazyVim.config.kind_filter }) end, desc = "LSP Workspace Symbols"},
        -- {
        --     "<leader>sS",
        --     function()
        --         require("fzf-lua").lsp_live_workspace_symbols({
        --             regex_filter = symbols_filter,
        --         })
        --     end,
        --     desc = "Goto [S]ymbol (Workspace)",
        -- },
        {
            "<leader>fl",
            function()
                local path = vim.fn.stdpath("data") .. "/lazy/LazyVim"
                if vim.uv.fs_stat(path) then
                    Snacks.picker.files({
                        cwd = path,
                    })
                    -- require("fzf-lua").files({
                    --     cwd = path,
                    -- })
                end
            end,
            desc = "Find [l]azy files",
        },
        {
            "<leader>sl",
            function()
                local path = vim.fn.stdpath("data") .. "/lazy/LazyVim"
                if vim.uv.fs_stat(path) then
                    Snacks.picker.grep({
                        cwd = path
                    })
                    -- require("fzf-lua").live_grep_glob({
                    --     cwd = path,
                    -- })
                end
            end,
            desc = "Grep from [l]azy files",
        },
        {
            "<leader>ft",
            function()
                -- NOTE: requires env variable $VAULT (`export VAULT=...` in your .bashrc or .zshrc)
                local todos = vim.fn.expand("$VAULT/Personal/todos")
                if vim.uv.fs_stat(todos) then
                    Snacks.picker.files({
                        cwd = todos,
                    })
                    -- require("fzf-lua").files({
                    --     cwd = todos,
                    -- })
                end
            end,
            desc = "Find [t]odos",
        },
            -- stylua: ignore end
            -- Snacks picker keymaps end
        },
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- Setup some globals for debugging (lazy-loaded)
                    _G.dd = function(...)
                        Snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        Snacks.debug.backtrace()
                    end
                    vim.print = _G.dd -- Override print to use snacks for `:=` command

                    -- Create some toggle mappings
                    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                    Snacks.toggle.diagnostics():map("<leader>ud")
                    Snacks.toggle.line_number():map("<leader>ul")
                    Snacks.toggle
                        .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                        :map("<leader>uc")
                    Snacks.toggle.treesitter():map("<leader>uT")
                    Snacks.toggle
                        .option("background", { off = "light", on = "dark", name = "Dark Background" })
                        :map("<leader>ub")
                    Snacks.toggle.inlay_hints():map("<leader>uh")
                end,
            })

            -- -- Simple LSP Progress
            vim.api.nvim_create_autocmd("LspProgress", {
                ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
                callback = function(ev)
                    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
                    vim.notify(vim.lsp.status(), "info", {
                        id = "lsp_progress",
                        title = "LSP Progress",
                        opts = function(notif)
                            notif.icon = ev.data.params.value.kind == "end" and " "
                                or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                        end,
                    })
                end,
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        opts = function()
            local Keys = require("lazyvim.plugins.lsp.keymaps").get()
            -- stylua: ignore
            vim.list_extend(Keys, {
                { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", has = "definition" },
                { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
                { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
                { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
                { "<leader>ss", function() Snacks.picker.lsp_symbols({ filter = LazyVim.config.kind_filter }) end, desc = "LSP Symbols", has = "documentSymbol" },
                { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols({ filter = LazyVim.config.kind_filter }) end, desc = "LSP Workspace Symbols", has = "workspace/symbols" },
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        optional = true,
        -- stylua: ignore
        keys = {
        { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
        { "<leader>sT", function () Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
        },
    },
}
