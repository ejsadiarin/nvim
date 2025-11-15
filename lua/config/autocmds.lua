-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ################################
-- #    AUTOCOMMANDS (AUTOCMD)    #
-- ################################
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    pattern = "*",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- save cursor position
vim.api.nvim_create_autocmd({ "VimEnter", "CursorMoved" }, {
    desc = "Retain cursor at end after yanking",
    group = vim.api.nvim_create_augroup("save-cursor-position", { clear = true }),
    callback = function()
        cursor_pos = vim.fn.getpos(".")
    end,
})

-- Retain cursor position after yank (cursor pos at end, not at start)
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Retain cursor at end after yanking",
    group = vim.api.nvim_create_augroup("retain-cursor-yank", { clear = true }),
    pattern = "*",
    callback = function()
        if vim.v.event.operator == "y" then
            vim.fn.setpos(".", cursor_pos)
        end
    end,
})

-- -- Remove padding around neovim instance (OSC 11 and OSC 111 keeps terminal background color in sync with Neovim's bg color)
-- -- see: https://www.reddit.com/r/neovim/comments/1ehidxy/you_can_remove_padding_around_neovim_instance/
-- -- also see: `mini.misc` module from 'mini.nvim' setup_termbg_sync() (ref: https://github.com/nvim-mini/mini.nvim/blob/74e6b722c91113bc70d4bf67249ed8de0642b20e/doc/mini-misc.txt#L171)
-- -- NOTE: (1) Make sure to have this executed before you load color scheme. Otherwise there will be no event for it to sync. Alternatively, add an explicit call to the first callback function and it should work as is.
-- -- (2) It will not sync if you manually set Normal highlight group. It must be followed by the ColorScheme event.
-- vim.api.nvim_create_autocmd({ 'UIEnter', 'ColorScheme' }, {
--   callback = function()
--     local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
--     if not normal.bg then
--       return
--     end
--     io.write(string.format('\027]11;#%06x\027\\', normal.bg))
--   end,
-- })
-- vim.api.nvim_create_autocmd('UILeave', {
--   callback = function()
--     io.write '\027]111\027\\'
--   end,
-- })

-- add 'q' keymap on command mode to close quickfix window and 'help' filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = {
        "qf",
        "help",
        "PlenaryTestPopup",
        "grug-far",
        "lspinfo",
        "notify",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "checkhealth",
        "neotest-output",
        "neotest-output-panel",
        "neotest-summary",
        "dbout",
        "gitsigns.blame",
        "fugitive",
    },
    callback = function()
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = 0, nowait = true, silent = true })
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("last-loc", { clear = true }),
    callback = function(event)
        local exclude = { "gitcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
            return
        end
        vim.b[buf].lazyvim_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = vim.api.nvim_create_augroup("json-conceallevel", { clear = true }),
    pattern = { "json", "jsonc", "json5" },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = vim.api.nvim_create_augroup("resize-splits", { clear = true }),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- auto insert mode on terminal mode when 'term://' opened
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
    group = vim.api.nvim_create_augroup("auto-insert-on-term-mode", { clear = true }),
    pattern = { "*" },
    callback = function()
        if vim.opt.buftype:get() == "terminal" then
            vim.cmd(":startinsert")
        end
    end,
})

-- TODO: moving qflist on cursor move
-- vim.api.nvim_create_autocmd('CursorMoved', {
--   pattern = 'qf',
--   callback = function()
--     vim.cmd [[ copen ]]
--   end,
-- })

-- -- set conceallevel = 0 for markdown files
-- vim.api.nvim_create_autocmd('FileType', {
--   group = vim.api.nvim_create_augroup('markdown-conceallevel', { clear = true }),
--   pattern = 'markdown',
--   callback = function()
--     vim.opt_local.conceallevel = 0 -- so that everything is visible in markdown files
--   end,
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "yaml", "yml" },
  group = vim.api.nvim_create_augroup("yaml-schema-picker", { clear = true }),
  callback = function()
    local function select_yaml_schema()
      local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
      if not lspconfig_ok then
        vim.notify("lspconfig not found", vim.log.levels.ERROR)
        return
      end

      local schemastore_ok, schemastore = pcall(require, "schemastore")
      if not schemastore_ok then
        vim.notify("schemastore.nvim not found", vim.log.levels.ERROR)
        return
      end

      -- 1. Get schemas from the config
      local yamlls_opts = lspconfig.yamlls.manager.get_config()
      local schemas = yamlls_opts.settings.yaml.schemas

      local choices = {}
      for uri, data in pairs(schemas) do
        local name
        if type(data) == "table" and data.name then
          name = data.name
        else
          name = uri
        end
        choices[uri] = name
      end

      -- Add schemas from schemastore that are not in the custom list
      local schemastore_schemas = schemastore.yaml.schemas()
      for uri, data in pairs(schemastore_schemas) do
        if not choices[uri] then
          choices[uri] = data.name or uri
        end
      end

      local formatted_choices = {}
      for uri, name in pairs(choices) do
        table.insert(formatted_choices, { name = name, uri = uri })
      end

      -- 2. Show picker
      vim.ui.select(formatted_choices, {
        prompt = "Select YAML Schema for current buffer",
        format_item = function(item)
          return item.name
        end,
      }, function(choice)
        if not choice then
          return
        end

        -- 3. Apply schema
        local clients = vim.lsp.get_active_clients({ bufnr = 0, name = "yamlls" })
        if #clients > 0 then
          local client = clients[1]
          local file_uri = vim.uri_from_bufnr(0)
          -- Notifying the server about a configuration change for a specific file
          client.notify("workspace/didChangeConfiguration", {
            settings = {
              yaml = {
                schemas = {
                  [choice.uri] = file_uri,
                },
              },
            },
          })
          vim.notify("Applied schema: " .. choice.name)
        else
          vim.notify("yamlls is not active for this buffer.", vim.log.levels.WARN)
        end
      end)
    end

    vim.keymap.set("n", "<leader>cy", select_yaml_schema, { buffer = true, desc = "Change YAML Schema" })
  end,
})

-- -- wincmd L all vim-fugitive buffers
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "fugitive" },
--     command = "wincmd L",
-- })

-- -- disable treesitter on large files (UPDATE (2024-10-24): better solved by folke's snacks.nvim bigfile module)
-- local aug = vim.api.nvim_create_augroup('buf_large', { clear = true })
-- vim.api.nvim_create_autocmd({ 'BufReadPre' }, {
--     callback = function()
--         local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
--         local max_filesize = 100 * 1024                      -- 100kb
--         if ok and stats and (stats.size > max_filesize) then -- 1000000
--             vim.cmd 'syntax off'
--             vim.cmd 'filetype off'                           -- this triggers AST build and lags the buffer
--             vim.b.undofile = false
--             vim.b.large_buf = true
--             vim.opt_local.foldmethod = 'manual'
--             vim.opt_local.spell = false
--             vim.cmd 'LspStop'
--             -- vim.cmd 'Markview disable'
--         else
--             vim.cmd 'syntax on'
--             vim.cmd 'filetype on'
--             vim.opt.undofile = true
--             vim.b.large_buf = false
--         end
--     end,
--     group = aug,
--     pattern = '*',
-- })

-- do :w on :W (remaps)
vim.api.nvim_create_user_command("W", "w", {})

-- copy to system clipboard on yank only (not on delete, etc.)
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.fn.setreg("+", vim.fn.getreg("0"))
    end,
})

-- automatically open Trouble qflist (test with :silent grep vim %)
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    callback = function()
        vim.cmd([[Trouble qflist open focus=true]])
    end,
})

--- ######### GO-RELATED PERF IMPORTS ######### ---
-- vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format({ async = true })]]

-- PERF: go organize imports autosave non-blocking func for perf improvement (ref: https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-1801096383)
-- local golang_organize_imports = function(bufnr, isPreflight)
--     local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding(bufnr))
--     params.context = { only = { "source.organizeImports" } }
--
--     if isPreflight then
--         vim.lsp.buf_request(bufnr, "textDocument/codeAction", params, function() end)
--         return
--     end
--
--     local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 3000)
--     for _, res in pairs(result or {}) do
--         for _, r in pairs(res.result or {}) do
--             if r.edit then
--                 vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding(bufnr))
--             else
--                 vim.lsp.buf.execute_command(r.command)
--             end
--         end
--     end
-- end
--
-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("LspFormatting", {}),
--     callback = function(args)
--         local bufnr = args.buf
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--
--         if client.name == "gopls" then
--             -- hack: Preflight async request to gopls, which can prevent blocking when save buffer on first time opened
--             golang_organize_imports(bufnr, true)
--
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 pattern = "*.go",
--                 group = vim.api.nvim_create_augroup("LspGolangOrganizeImports." .. bufnr, {}),
--                 callback = function()
--                     golang_organize_imports(bufnr)
--                 end,
--             })
--         end
--     end,
-- })
--- ######### GO-RELATED PERF IMPORTS END ######### ---

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "java", "kt" },
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.expandtab = true
    end,
})
