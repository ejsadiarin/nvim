-- #################
-- #    GLOBALS    #
-- #################

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

if pcall(require, "lazyvim") then
    vim.g.snacks_animate = false
    vim.g.minipairs_disable = true
    vim.g.lazyvim_picker = "snacks"
end

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
vim.g.diagnostics_active = true
vim.g.markdown_recommended_style = 0 -- Disable default markdown styles (see https://www.reddit.com/r/neovim/comments/z2lhyz/comment/ixjb7je)
vim.g.autoformat = true -- format on save

local _border = "rounded"

vim.diagnostic.config({
    float = { border = _border },
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
        -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
        -- prefix = "icons",
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    signs = {
        severity = {
            min = vim.diagnostic.severity.HINT,
        },
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = "󰌵",
        },
    },
})

-- Rounded borders for LSP hover floating window
-- TODO: add snacks.nvim win, check if have snacks.nvim first, if not then fallback to native
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "rounded",
    -- add the title in hover float window
    -- title = "hover"
})

-- Rounded borders for LSP signatureHelp floating window
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

-- #################
-- #    OPTIONS    #
-- #################
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.opt.termguicolors = true
vim.opt.guicursor = "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor" -- Blinking cursor
-- vim.opt.grepprg = 'rg --vimgrep --hidden -g !.git'
-- vim.opt.grepformat = '%f:%l:%c:%m'
-- vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver100/,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
vim.opt.cursorline = true -- Show which line your cursor is on
-- vim.opt.pumblend = 0 -- related to autocomplete documentation bg transparent, idk not make transparent bg
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
-- Fold options
-- vim.opt.foldtext = 'v:lua.FoldText()' -- custom fold (see: lua/scripts/foldtext.lua)
-- vim.opt.foldmethod = 'indent'
-- these opts only folds all standard function blocks and not the sub-blocks inside that
-- vim.opt.foldlevel = 2
-- vim.opt.foldlevelstart = 1
-- vim.opt.foldnestmax = 2

vim.opt.encoding = "UTF-8"

vim.opt.number = true -- Set numbered lines
vim.opt.relativenumber = true -- Set relative line numbers

vim.opt.hlsearch = true -- Highlight on search
vim.opt.incsearch = true -- While typing a search command, show where the pattern matches

vim.opt.mouse = "a" -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.background = "dark"

vim.opt.showmode = true -- Show mode for exquisite simplicity

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
--     vim.opt.clipboard = "unnamed"
--     -- vim.opt.clipboard = 'unnamedplus'
-- end)

vim.opt.clipboard = "unnamed"

vim.opt.tabstop = 4 -- Insert 4 spaces for a tab
vim.opt.softtabstop = 4 -- Number of spaces tabs count for while editing
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.smartindent = true -- Makes indenting smart
vim.opt.breakindent = true -- Enable break indent

-- Save undo history
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override `'ignorecase'` if the search pattern contains upper case characters
vim.opt.cmdheight = 1 -- More space in the neovim command line for displaying messages
vim.opt.breakindent = true -- Enable break indent
-- vim.opt.wildignore:append({ "*/node_modules/*" }) -- Ignore when expanding wildcards, completing file or directory names

vim.opt.conceallevel = 1 -- default

-- vim.opt.formatoptions = vim.o.formatoptions:gsub("cro", "") -- Avoid comments to continue on new lines
vim.opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
vim.opt.formatoptions = "jcroqlnt" -- tcqj

vim.opt.signcolumn = "yes" -- Keep signcolumn on by default
-- vim.opt.foldcolumn = "1" -- '0' is not bad
-- vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.opt.foldlevelstart = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.opt.foldenable = true -- Enable folding

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.laststatus = 3 -- Global statusline when on split

vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.statusline = "%S"

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false -- if true then 'listchars' will display the whitespace
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- vim.opt.fillchars = {
--     foldopen = "",
--     foldclose = "",
--     fold = " ",
--     foldsep = " ",
--     diff = "╱",
--     -- eob = " ",
-- }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.wrap = true -- Display long lines as just one line
vim.opt.sidescrolloff = 5 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
-- vim.opt.linebreak = true -- Wrap long lines at a character in 'breakat'
-- vim.opt.textwidth = 120 -- Maximum width of text that is being inserted vim.cmd("set fo-=1") -- Don't break lines after a one-letter word
-- vim.opt.list = false -- Hide characters on tabs and spaces
-- vim.opt.fillchars.eob = ' ' -- Empty lines at the end of a buffer as ` `
vim.opt.autoread = true -- Sync buffers automatically
vim.opt.swapfile = false -- Disable neovim generating swapfiles and showing the error
vim.opt.spell = false -- no spelling checks
vim.opt.spelllang = { "en" }

-- if vim.fn.has("nvim-0.10") == 1 then
--     vim.opt.smoothscroll = true
--     vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
--     vim.opt.foldmethod = "expr"
--     vim.opt.foldtext = ""
-- else
--     vim.opt.foldmethod = "indent"
--     vim.opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
-- end
