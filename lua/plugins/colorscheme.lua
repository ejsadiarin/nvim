-- Colorscheme:
-- --> Catppuccin
-- --> VSCode
-- --> Tokyo Night

return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin-nvim",
        },
    },
    -- {
    --     "garymjr/opencode.nvim",
    --     priority = 1000,
    --     opts = {
    --         style = "dark", -- "dark" or "light"
    --         transparent = false, -- Enable transparent background
    --         terminal_colors = true, -- Apply colors to terminal
    --         styles = {
    --             comments = { italic = true },
    --             keywords = { bold = true },
    --             functions = {},
    --             variables = {},
    --             types = {},
    --         },
    --         integrations = {
    --             telescope = true,
    --             nvimtree = true,
    --             which_key = true,
    --             cmp = true,
    --             gitsigns = true,
    --             treesitter = true,
    --         },
    --         highlight_overrides = {
    --             -- Custom highlight overrides
    --             Normal = { fg = "#ffffff" },
    --         },
    --     },
    -- },
    -- WARN: THIS IS A VERY HEAVILY CUSTOMIZED MONOKAI
    -- {
    --     "loctvl842/monokai-pro.nvim",
    --     lazy = false,
    --     priority = 1001, -- higher than LazyVim (1000) to ensure setup runs first
    --     keys = {
    --         { "<leader>ec", "<cmd>colorscheme monokai-pro<cr>", desc = "Reload monokai-pro" },
    --     },
    --     config = function()
    --         require("monokai-pro").setup({
    --             transparent_background = true,
    --             terminal_colors = true,
    --             devicons = false, -- highlight the icons of `nvim-web-devicons`
    --             styles = {
    --                 comment = { italic = true },
    --                 keyword = { italic = true }, -- any other keyword
    --                 type = { italic = true }, -- (preferred) int, long, char, etc
    --                 storageclass = { italic = true }, -- static, register, volatile, etc
    --                 structure = { italic = true }, -- struct, union, enum, etc
    --                 parameter = { italic = true }, -- parameter pass in function
    --                 annotation = { italic = true },
    --                 tag_attribute = { italic = true }, -- attribute of tag in reactjs
    --             },
    --             filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
    --             -- Enable this will disable filter option
    --             day_night = {
    --                 enable = false, -- turn off by default
    --                 day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    --                 night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
    --             },
    --             inc_search = "background", -- underline | background
    --             background_clear = {
    --                 "float_win",
    --                 "toggleterm",
    --                 "telescope",
    --                 "which-key",
    --                 -- 'renamer',
    --                 "notify",
    --                 -- "nvim-tree",
    --                 "neo-tree",
    --                 "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
    --             }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
    --             plugins = {
    --                 bufferline = {
    --                     underline_selected = false,
    --                     underline_visible = false,
    --                 },
    --                 indent_blankline = {
    --                     context_highlight = "default", -- default | pro
    --                     context_start_underline = false,
    --                 },
    --             },
    --             ---@param cs Colorscheme
    --             ---@param p ColorschemeOptions
    --             ---@param Config MonokaiProOptions
    --             ---@param hp Helper
    --             -- override = function(cs: Colorscheme, p: ColorschemeOptions, Config: MonokaiProOptions, hp: Helper) end,
    --             ---@param filter "classic" | "machine" | "octagon" | "pro" | "ristretto" | "spectrum"
    --             override_palette = function(filter)
    --                 return {
    --                     -- Background and text colors
    --                     background = "#273136", -- Main background color
    --                     dark1 = "#1d2528", -- Slightly lighter background
    --                     dark2 = "#161b1e", -- Deep background color (darkest)
    --                     text = "#fcffb8", -- Primary text color
    --                     -- text = '#f2fffc',       -- Primary text color
    --                     -- accent1 = "#c24c5a", -- Red accent (functions)
    --                     accent1 = "#ff6d7e", -- Red accent (functions)
    --                     accent2 = "#ffb270", -- Orange accent (parameter)
    --                     -- accent3 = "#90ee90", -- Yellow accent (strings)
    --                     accent3 = "#f9cc6c", -- Yellow accent (strings)
    --                     -- accent3 = '#fabd2f',    -- Yellow accent
    --                     -- accent4 = '#97e522',    -- Green accent
    --                     accent4 = "#a2e57b", -- Green accent
    --                     -- accent5 = '#83a598', -- Blue accent
    --                     -- accent5 = '#4aa4bf', -- Blue accent
    --                     accent5 = "#7cd5f1",
    --                     accent6 = "#baa0f8", -- Purple accent (for booleans,  etc.)
    --                     dimmed1 = "#b8bcb9", -- Light gray
    --                     dimmed2 = "#8b9798", -- Medium-light gray
    --                     dimmed3 = "#6b7678", -- Medium gray
    --                     dimmed4 = "#545f62", -- Medium-dark gray
    --                     dimmed5 = "#1e1e1e", -- Dark gray
    --                 }
    --             end,
    --             override = function(scheme)
    --                 return {
    --                     Normal = { fg = "#fcffb8", bg = "NONE" }, -- #19171a
    --                     -- Identifier = { fg = "#fcffb8", bg = "NONE" },
    --                     -- Identifier = { fg = "#ffffff", bg = "NONE" }, -- #19171a
    --                     CursorLine = { bg = "#1d1e24" },
    --                     CursorLineNr = { fg = "#fcef0b" },
    --                     -- CursorLineNr = { fg = "#b8bcb9" },
    --                     Cursor = { fg = "#fcef0b", bg = "#fcef0b" },
    --                     NormalFloat = { bg = "#161b1e" }, -- Set a solid background for floating windows
    --                     FloatBorder = { fg = "#425157", bg = "#161b1e" }, -- Ensure border is visible with a solid background
    --                     Directory = { fg = "#f9cc6c" },
    --                     SignColumn = { fg = "NONE", bg = "NONE" },
    --                     Comment = { bg = "NONE" },
    --
    --                     SnacksIndentScope = { fg = "#555555" },
    --                     SnacksIndent = { fg = "#222a2d" },
    --                     SnacksDim = { link = "Conceal " },
    --
    --                     -- For DBUI (vim-dadbod-ui)
    --                     NotificationInfo = { bg = "NONE" },
    --                     NotificationWarning = { bg = "NONE" },
    --                     NotificationError = { bg = "NONE" },
    --
    --                     -- NOTE: for Go syntax
    --                     ["@lsp.type.namespace.go"] = { fg = "#b8bcb9" },
    --                     -- func keyword (same)
    --                     ["@lsp.type.keyword.go"] = { fg = "#ff6d7e" },
    --                     -- ["@lsp.type.keyword.go"] = { fg = "#7cd5f1" },
    --                     ["@keyword.function.go"] = { fg = "#7cd5f1" },
    --                     --
    --                     ["@function"] = { fg = "#a2e57b" }, -- #fcffb8
    --                     -- ["@string"] = { fg = "#e6db74" },
    --                     -- ["@property.yaml"] = { fg = "#2EF0E9" },
    --                     -- ["@string.yaml"] = { fg = "#90ee90" },
    --                     ["@keyword"] = { fg = "#fcef0b" },
    --                     ["@punctuation.bracket"] = { fg = "#fcffb8" },
    --                     ["@module.go"] = { fg = "#b8bcb9" },
    --
    --                     -- ["@lsp.type.namespace.go"] = { fg = "#be7be5" },
    --                     -- ['@lsp.type.namespace.go'] = { fg = '#fcffb8' },
    --                     -- ["@keyword.function.lua"] = { fg = "#fcef0b" },
    --                     Function = { fg = "#ff6d7e" },
    --                     -- Todo = { bg = "#7cd5f1", fg = "#222a2d", bold = true },
    --                     TodoBgNOTE = { bg = "NONE", fg = "#7cd5f1", bold = true },
    --                     TodoBgTODO = { bg = "NONE", fg = "#7cd5f1", bold = true },
    --                     TodoBgWARN = { bg = "NONE", fg = "#ffb270", bold = true },
    --                     TodoBgPERF = { bg = "NONE", fg = "#fcffb8", bold = true },
    --                     TodoBgHACK = { bg = "NONE", fg = "#ffb270", bold = true },
    --                     TodoBgFIX = { bg = "NONE", fg = "#c24c5a", bold = true },
    --                     yamlBlockMappingKey = { fg = "#c24c5a" },
    --
    --                     MarkViewCode = { bg = "#141421" },
    --                     MarkViewInlineCode = { bg = "#141421" },
    --
    --                     -- LazyNormal = { fg = '#909c9d', bg = '#222a2d' },
    --                     LazyNormal = { fg = "#f2fffc", bg = "NONE" },
    --                     LazyButton = { bg = "#1d1e24" },
    --
    --                     StatusLine = { bg = "NONE" },
    --                     SnippetTabstop = { bg = "NONE" },
    --
    --                     BlinkCmpKindMethod = { fg = "#a2e57b" },
    --                     BlinkCmpKindFunction = { fg = "#a2e57b" },
    --
    --                     -- FzfLuaTitle = { bg = "#1d1e24" },
    --
    --                     TelescopeNormal = { fg = "#f2fffc" },
    --                     TelescopeResultsNormal = { fg = "#f2fffc" },
    --                     TelescopeResultsFunction = { fg = "#f9cc6c", bg = "#1d1e24" },
    --                     TelescopeResultsTitle = { bg = "#f9cc6c" },
    --                     TelescopePromptTitle = { bg = "#f9cc6c" },
    --                     TelescopePreviewTitle = { bg = "#f9cc6c" },
    --
    --                     GrappleTitle = { fg = "#f2fffc", bg = "#1d1e24" },
    --                     GrappleFooter = { fg = "#f2fffc", bg = "#1d1e24" },
    --
    --                     SnacksScratchTitle = { fg = "#f2fffc", bg = "#1d1e24" },
    --                     SnacksScratchFooter = { fg = "#f2fffc", bg = "#1d1e24" },
    --                     SnacksPickerTree = { bg = "NONE" },
    --                     SnacksPickerBorder = { bg = "NONE" },
    --                     SnacksPickerPrompt = { bg = "NONE" },
    --                     SnacksPickerInputBorder = { bg = "NONE" },
    --
    --                     -- SnacksNormal = { bg = "NONE" },
    --                     -- SnacksWinBar = { bg = "NONE" },
    --                     -- SnacksBackdrop = { bg = "NONE" },
    --                     -- SnacksNormalNC = { bg = "NONE" },
    --                     -- SnacksWinBarNC = { bg = "NONE" },
    --                     -- SnacksNotifierInfo = { bg = "NONE" },
    --                     -- SnacksNotifierWarn = { bg = "NONE" },
    --                     -- SnacksNotifierDebug = { bg = "NONE" },
    --                     -- SnacksNotifierError = { bg = "NONE" },
    --                     -- SnacksNotifierTrace = { bg = "NONE" },
    --                     -- SnacksNotifierHistory = { bg = "NONE" },
    --                     -- SnacksNotifierIconInfo = { bg = "NONE" },
    --                     -- SnacksNotifierIconWarn = { bg = "NONE" },
    --                     -- SnacksNotifierIconDebug = { bg = "NONE" },
    --                     -- SnacksNotifierIconError = { bg = "NONE" },
    --                     -- SnacksNotifierIconTrace = { bg = "NONE" },
    --                     -- SnacksNotifierTitleInfo = { bg = "NONE" },
    --                     -- SnacksNotifierTitleWarn = { bg = "NONE" },
    --                     -- SnacksNotifierBorderInfo = { bg = "NONE" },
    --                     -- SnacksNotifierBorderWarn = { bg = "NONE" },
    --                     -- SnacksNotifierFooterInfo = { bg = "NONE" },
    --                     -- SnacksNotifierFooterWarn = { bg = "NONE" },
    --                     -- SnacksNotifierTitleDebug = { bg = "NONE" },
    --                     -- SnacksNotifierTitleError = { bg = "NONE" },
    --                     -- SnacksNotifierTitleTrace = { bg = "NONE" },
    --                     -- SnacksNotifierBorderDebug = { bg = "NONE" },
    --                     -- SnacksNotifierBorderError = { bg = "NONE" },
    --                     -- SnacksNotifierBorderTrace = { bg = "NONE" },
    --                     -- SnacksNotifierFooterDebug = { bg = "NONE" },
    --                     -- SnacksNotifierFooterError = { bg = "NONE" },
    --                     -- SnacksNotifierFooterTrace = { bg = "NONE" },
    --                     -- SnacksNotifierHistoryTitle = { bg = "NONE" },
    --                     -- SnacksNotifierHistoryDateTime = { bg = "NONE" },
    --
    --                     ["@markup.raw.block.markdown"] = { bg = "NONE" },
    --                     ["@markup.raw.markdown_inline"] = { bg = "NONE" },
    --
    --                     BufferLineBackground = { bg = "NONE" },
    --                     BufferLineSeparator = { bg = "NONE" },
    --                     BufferLineTab = { bg = "NONE" },
    --                     BufferLineWarning = { bg = "NONE" },
    --                     BufferLineError = { bg = "NONE" },
    --                     BufferLinePick = { bg = "NONE" },
    --                     BufferLineInfo = { bg = "NONE" },
    --                     BufferLineHint = { bg = "NONE" },
    --                     BufferLineModified = { bg = "NONE" },
    --                     BufferLineCloseButton = { bg = "NONE" },
    --                     BufferLineIndicator = { bg = "NONE" },
    --                     BufferLineDuplicate = { bg = "NONE" },
    --
    --                     BufferLineDevIconGoModInactive = { bg = "NONE" },
    --                     BufferLineDevIconEnvInactive = { bg = "NONE" },
    --                     BufferLineDevIconGoInactive = { bg = "NONE" },
    --                     BufferLineDevIconGoMod = { bg = "NONE" },
    --                     BufferLineDevIconGo = { bg = "NONE" },
    --                     BufferLineDevIconEnv = { bg = "NONE" },
    --
    --                     BufferLineBufferSelected = { bg = "NONE" },
    --                     BufferLineModifiedIcon = { bg = "NONE" },
    --                     BufferLineIndicatorSelected = { bg = "NONE" },
    --                     BufferLineModifiedSelected = { bg = "NONE" },
    --                     BufferLineBuffer = { bg = "NONE" },
    --
    --                     BufferLineDevIconLuaSelected = { bg = "NONE" },
    --                     BufferLineDevIconDefaultSelected = { bg = "NONE" },
    --
    --                     BufferLineGroupLabel = { bg = "NONE" },
    --                     BufferLineDevIconLua = { bg = "NONE" },
    --                     BufferLineErrorDiagnostic = { bg = "NONE" },
    --                     BufferLineInfoDiagnostic = { bg = "NONE" },
    --                     BufferLineHintDiagnostic = { bg = "NONE" },
    --                     BufferLineDevIconDefault = { bg = "NONE" },
    --                     BufferLineTabSeparator = { bg = "NONE" },
    --                     BufferLineWarningDiagnostic = { bg = "NONE" },
    --                     BufferLineDevIconLuaInactive = { bg = "NONE" },
    --                     BufferLineDevIconDefaultInactive = { bg = "NONE" },
    --
    --                     BufferLineHintVisible = { bg = "NONE" },
    --                     BufferLineInfoVisible = { bg = "NONE" },
    --                     BufferLinePickVisible = { bg = "NONE" },
    --                     BufferLineErrorVisible = { bg = "NONE" },
    --                     BufferLineBufferVisible = { bg = "NONE" },
    --                     BufferLineNumbersVisible = { bg = "NONE" },
    --                     BufferLineWarningVisible = { bg = "NONE" },
    --                     BufferLineModifiedVisible = { bg = "NONE" },
    --                     BufferLineDuplicateVisible = { bg = "NONE" },
    --                     BufferLineIndicatorVisible = { bg = "NONE" },
    --                     BufferLineSeparatorVisible = { bg = "NONE" },
    --                     BufferLineDiagnosticVisible = { bg = "NONE" },
    --                     BufferLineCloseButtonVisible = { bg = "NONE" },
    --                     BufferLineHintDiagnosticVisible = { bg = "NONE" },
    --                     BufferLineInfoDiagnosticVisible = { bg = "NONE" },
    --                     BufferLineErrorDiagnosticVisible = { bg = "NONE" },
    --                     BufferLineWarningDiagnosticVisible = { bg = "NONE" },
    --
    --                     -- Avante.nvim
    --                     AvanteTitle = { fg = "#273136", bg = "#a2e57b" }, -- background / accent4
    --                     AvanteReversedTitle = { fg = "#a2e57b" },
    --                     AvanteSubtitle = { fg = "#273136", bg = "#7cd5f1" }, -- background / accent5
    --                     AvanteReversedSubtitle = { fg = "#7cd5f1" },
    --                     AvanteThirdTitle = { fg = "#b8bcb9", bg = "#1e1e1e" }, -- dimmed1 / dimmed5
    --                     AvanteReversedThirdTitle = { fg = "#6b7678" }, -- dimmed3
    --
    --                     avantepopuphint = { bg = "#1d2528" }, -- dark1
    --                     avanteinlinehint = { fg = "#7cd5f1" }, -- accent5
    --
    --                     -- Sidebar needs a background if transparent is on
    --                     AvanteSidebarNormal = { bg = "#161b1e" }, -- dark2
    --
    --                     -- Input area
    --                     AvantePromptInput = { bg = "#1d1e24" }, -- CursorLine bg
    --                     AvantePromptInputBorder = { fg = "#6b7678" }, -- dimmed3
    --
    --                     -- Diff/Conflict
    --                     AvanteConflictCurrent = { bg = "#562C30", bold = true },
    --                     AvanteConflictIncoming = { bg = "#314753", bold = true },
    --                 }
    --             end,
    --         })
    --
    --         -- Ensure custom snacks highlights are applied after colorscheme loads
    --         vim.api.nvim_create_autocmd("ColorScheme", {
    --             pattern = "monokai-pro",
    --             callback = function()
    --                 -- Apply custom snacks highlights after colorscheme is loaded
    --                 vim.defer_fn(function()
    --                     local highlights = {
    --                         SnacksScratchTitle = { fg = "#f2fffc", bg = "#1d1e24" },
    --                         SnacksScratchFooter = { fg = "#f2fffc", bg = "#1d1e24" },
    --                         SnacksPickerTree = { bg = "NONE" },
    --                         SnacksPickerBorder = { fg = "#545f62", bg = "NONE" },
    --                         SnacksPickerPrompt = { bg = "NONE" },
    --                         SnacksPickerInputBorder = { bg = "NONE" },
    --                     }
    --
    --                     for name, hl in pairs(highlights) do
    --                         vim.api.nvim_set_hl(0, name, hl)
    --                     end
    --                 end, 100)
    --             end,
    --         })
    --     end,
    -- },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "mocha",
            background = {
                light = "latte",
                dark = "mocha",
            },
            transparent_background = true,
            float = {
                transparent = true,
                solid = false,
            },
            show_end_of_buffer = false,
            term_colors = true,
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = true,
            no_bold = true,
            no_underline = false,
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            lsp_styles = {
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                    ok = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                    ok = { "underline" },
                },
                inlay_hints = {
                    background = true,
                },
            },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  T H O R N W E A V E  ·  Color Overrides        ║
            -- ║  tech × celtic × fantasy × briar                ║
            -- ╚══════════════════════════════════════════════════╝
            color_overrides = {
                mocha = {
                    -- ── Backgrounds ──────────────────────────────────
                    base = "#0F0C1A", -- tw.bg.base
                    mantle = "#171224", -- tw.bg.surface
                    crust = "#080610", -- tw.bg.abyss

                    -- ── Surface layers ────────────────────────────────
                    surface0 = "#1F1830", -- tw.bg.raised
                    surface1 = "#27203D", -- tw.bg.overlay
                    surface2 = "#312849", -- tw.bg.mist

                    -- ── Text hierarchy ────────────────────────────────
                    text = "#EDE8F8", -- tw.text.rune    (primary)
                    subtext1 = "#B0A8CC", -- tw.text.vellum  (secondary)
                    subtext0 = "#8C84A8", -- tw.text.between (tertiary)
                    overlay2 = "#6C6280", -- tw.text.faded   (muted)
                    overlay1 = "#564E6A", -- dim muted
                    overlay0 = "#6C6280", -- tw.text.faded   (muted)
                    -- overlay0 = "#3A3050", -- tw.text.specter (disabled)

                    -- ── 16 terminal colors ────────────────────────────
                    -- black / dark variants use surface tones
                    -- Mapped: red→briar, green→thorn, yellow→gilt,
                    --         blue→circuit, magenta→arcane, cyan→circuit
                    black = "#1F1830", -- tw.bg.raised  (dark bg)
                    red = "#FF4D8D", -- tw.briar.bright
                    green = "#22D98E", -- tw.thorn.bright
                    yellow = "#FFD166", -- tw.gilt.bright
                    blue = "#009EC7", -- tw.circuit.dim
                    magenta = "#8B3FCC", -- tw.arcane.mid
                    cyan = "#00B8CC", -- tw.circuit.mid
                    white = "#B0A8CC", -- tw.text.vellum

                    -- ── Extended palette (UI accents) ─────────────────
                    -- rosewater → neutral highlight / cursor
                    rosewater = "#EDE8F8", -- tw.text.rune

                    -- lavender → selection / visual bg accent
                    lavender = "#C084FC", -- tw.arcane.bright

                    -- blue family → circuit teal (functions, links)
                    sapphire = "#00B8CC", -- tw.circuit.mid
                    sky = "#00E5FF", -- tw.circuit.bright
                    teal = "#00E5FF", -- tw.circuit.bright

                    -- peach → gilt gold (numbers, warnings)
                    peach = "#FFD166", -- tw.gilt.bright

                    -- red/pink family → briar rose (errors, constants)
                    maroon = "#CC2563", -- tw.briar.mid
                    flamingo = "#FF4D8D", -- tw.briar.bright
                    pink = "#FF4D8D", -- tw.briar.bright

                    -- mauve → arcane violet (keywords, magic)
                    mauve = "#C084FC", -- tw.arcane.bright

                    -- green → thorn emerald (strings, success)
                    -- (catppuccin "green" slot used in treesitter for strings)
                },
            },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Custom highlight overrides                      ║
            -- ║  Covers: TS, Go, Python, C#, Java, Lua, CSS,    ║
            -- ║          Rust, HTML, JSX, YAML, JSON, Bash       ║
            -- ╚══════════════════════════════════════════════════╝
            custom_highlights = function(colors)
                -- Shorthand aliases for readability
                local circuit_bright = "#00E5FF"
                local circuit_mid = "#00B8CC"
                local circuit_dim = "#009EC7"
                local arcane_bright = "#C084FC"
                local arcane_mid = "#8B3FCC"
                local gilt_bright = "#FFD166"
                local gilt_mid = "#C9930A"
                local briar_bright = "#FF4D8D"
                local briar_mid = "#CC2563"
                local thorn_bright = "#22D98E"
                local thorn_mid = "#0FA864"
                local text_rune = "#EDE8F8"
                local text_vellum = "#B0A8CC"
                local text_faded = "#6C6280"
                local text_specter = "#6C6280"
                -- local text_specter = "#3A3050"
                local bg_base = "#0F0C1A"
                local bg_surface = "#171224"
                local bg_raised = "#1F1830"
                local bg_overlay = "#27203D"

                return {
                    -- ── Core UI ────────────────────────────────────────
                    Normal = { bg = colors.none },
                    NormalNC = { bg = colors.none },
                    NormalFloat = { bg = colors.none },
                    FloatBorder = { bg = colors.none, fg = bg_overlay },
                    CursorLine = { bg = colors.none },
                    CursorLineNr = { fg = circuit_bright, bold = false },
                    LineNr = { fg = text_specter },
                    SignColumn = { bg = colors.none },
                    StatusLine = { bg = bg_raised, fg = text_vellum },
                    WinSeparator = { fg = bg_overlay },
                    Visual = { bg = "#280D40" }, -- arcane.deep
                    Search = { bg = "#3D2B00", fg = gilt_bright },
                    IncSearch = { bg = gilt_bright, fg = bg_base },
                    Pmenu = { bg = bg_raised, fg = text_vellum },
                    PmenuSel = { bg = "#511A80", fg = text_rune }, -- arcane.dim
                    PmenuSbar = { bg = bg_overlay },
                    PmenuThumb = { bg = arcane_mid },

                    -- ── Treesitter: universal syntax groups ────────────
                    -- Keywords (if, for, while, return, import, etc.)
                    ["@keyword"] = { fg = arcane_bright },
                    ["@keyword.control"] = { fg = arcane_bright },
                    ["@keyword.control.flow"] = { fg = arcane_bright },
                    ["@keyword.control.import"] = { fg = arcane_mid },
                    ["@keyword.import"] = { fg = arcane_mid },
                    ["@keyword.return"] = { fg = arcane_bright },
                    ["@keyword.function"] = { fg = arcane_bright },
                    ["@keyword.operator"] = { fg = arcane_mid },
                    ["@keyword.modifier"] = { fg = arcane_mid },
                    ["@keyword.exception"] = { fg = briar_bright },
                    ["@keyword.coroutine"] = { fg = arcane_bright },
                    ["@keyword.debug"] = { fg = briar_mid },
                    ["@keyword.directive"] = { fg = gilt_mid },
                    ["@conditional"] = { fg = arcane_bright },
                    ["@repeat"] = { fg = arcane_bright },
                    ["@exception"] = { fg = briar_bright },
                    ["@include"] = { fg = arcane_mid },

                    -- Functions
                    ["@function"] = { fg = circuit_bright },
                    ["@function.call"] = { fg = circuit_bright },
                    ["@function.builtin"] = { fg = circuit_mid },
                    ["@function.method"] = { fg = circuit_bright },
                    ["@function.method.call"] = { fg = circuit_bright },
                    ["@function.macro"] = { fg = circuit_mid },
                    ["@constructor"] = { fg = circuit_mid },

                    -- Types
                    ["@type"] = { fg = gilt_mid },
                    ["@type.builtin"] = { fg = gilt_mid },
                    ["@type.definition"] = { fg = gilt_mid },
                    ["@type.qualifier"] = { fg = arcane_mid },
                    ["@storageclass"] = { fg = arcane_mid },
                    ["@attribute"] = { fg = gilt_mid },
                    ["@attribute.builtin"] = { fg = gilt_mid },

                    -- Variables & parameters
                    ["@variable"] = { fg = text_rune },
                    ["@variable.builtin"] = { fg = briar_mid },
                    ["@variable.parameter"] = { fg = text_vellum },
                    ["@variable.member"] = { fg = arcane_mid },
                    ["@field"] = { fg = arcane_mid },
                    ["@property"] = { fg = arcane_mid },
                    ["@parameter"] = { fg = text_vellum },
                    ["@self"] = { fg = briar_mid },

                    -- Strings
                    ["@string"] = { fg = thorn_bright },
                    ["@string.regex"] = { fg = thorn_mid },
                    ["@string.escape"] = { fg = gilt_bright },
                    ["@string.special"] = { fg = gilt_bright },
                    ["@string.special.url"] = { fg = circuit_mid },
                    ["@string.special.symbol"] = { fg = thorn_mid },
                    ["@character"] = { fg = thorn_bright },
                    ["@character.special"] = { fg = gilt_bright },

                    -- Numbers & booleans
                    ["@number"] = { fg = gilt_bright },
                    ["@number.float"] = { fg = gilt_bright },
                    ["@float"] = { fg = gilt_bright },
                    ["@boolean"] = { fg = arcane_bright },

                    -- Constants
                    ["@constant"] = { fg = briar_bright },
                    ["@constant.builtin"] = { fg = briar_mid },
                    ["@constant.macro"] = { fg = briar_bright },
                    ["@enum"] = { fg = gilt_mid },
                    ["@enumMember"] = { fg = briar_bright },

                    -- Operators & punctuation
                    ["@operator"] = { fg = circuit_mid },
                    ["@punctuation"] = { fg = text_faded },
                    ["@punctuation.bracket"] = { fg = text_faded },
                    ["@punctuation.delimiter"] = { fg = text_faded },
                    ["@punctuation.special"] = { fg = circuit_mid },

                    -- Comments
                    ["@comment"] = { fg = text_faded, italic = true },
                    ["@comment.documentation"] = { fg = text_faded, italic = true },
                    ["@comment.note"] = { fg = thorn_mid, italic = true },
                    ["@comment.todo"] = { fg = gilt_mid, italic = true },
                    ["@comment.warning"] = { fg = gilt_bright, italic = true },
                    ["@comment.error"] = { fg = briar_bright, italic = true },

                    -- Namespace / module
                    ["@namespace"] = { fg = gilt_bright },
                    ["@module"] = { fg = gilt_bright },
                    ["@module.builtin"] = { fg = gilt_mid },
                    ["@label"] = { fg = circuit_mid },

                    -- Tags (HTML / JSX / TSX)
                    ["@tag"] = { fg = briar_mid },
                    ["@tag.builtin"] = { fg = briar_mid },
                    ["@tag.attribute"] = { fg = arcane_mid },
                    ["@tag.delimiter"] = { fg = text_faded },

                    -- ── Language-specific overrides ────────────────────
                    -- TypeScript / JavaScript
                    ["@keyword.type.typescript"] = { fg = arcane_bright },
                    ["@variable.member.typescript"] = { fg = arcane_mid },
                    ["@lsp.type.interface.typescript"] = { fg = gilt_mid },
                    ["@lsp.type.typeParameter.typescript"] = { fg = gilt_mid },
                    ["@lsp.type.enum.typescript"] = { fg = gilt_mid },
                    ["@lsp.type.enumMember.typescript"] = { fg = briar_bright },
                    ["@lsp.type.namespace.typescript"] = { fg = gilt_bright },
                    ["@lsp.type.decorator.typescript"] = { fg = gilt_mid },
                    ["@lsp.mod.readonly.typescript"] = { fg = briar_bright },

                    -- Go
                    ["@keyword.go"] = { fg = arcane_bright },
                    ["@type.go"] = { fg = gilt_mid },
                    ["@lsp.type.struct.go"] = { fg = gilt_mid },
                    ["@lsp.type.interface.go"] = { fg = gilt_mid },
                    ["@lsp.type.method.go"] = { fg = circuit_bright },
                    ["@function.method.go"] = { fg = circuit_bright },
                    ["@variable.member.go"] = { fg = arcane_mid },
                    ["@lsp.type.namespace.go"] = { fg = gilt_bright },

                    -- Python
                    ["@keyword.python"] = { fg = arcane_bright },
                    ["@type.python"] = { fg = gilt_mid },
                    ["@function.builtin.python"] = { fg = circuit_mid },
                    ["@variable.builtin.python"] = { fg = briar_mid },
                    ["@string.documentation.python"] = { fg = text_faded, italic = true },
                    ["@lsp.type.class.python"] = { fg = gilt_mid },
                    ["@lsp.type.decorator.python"] = { fg = gilt_mid },
                    ["@lsp.type.module.python"] = { fg = gilt_bright },

                    -- C / C++
                    ["@keyword.c"] = { fg = arcane_bright },
                    ["@keyword.cpp"] = { fg = arcane_bright },
                    ["@type.c"] = { fg = gilt_mid },
                    ["@type.cpp"] = { fg = gilt_mid },
                    ["@lsp.type.struct.c"] = { fg = gilt_mid },
                    ["@lsp.type.struct.cpp"] = { fg = gilt_mid },
                    ["@lsp.type.macro.c"] = { fg = briar_bright },
                    ["@lsp.type.macro.cpp"] = { fg = briar_bright },
                    ["@preproc"] = { fg = gilt_mid },
                    ["@define"] = { fg = briar_bright },

                    -- C# / Java (via LSP semantic tokens)
                    ["@lsp.type.class.cs"] = { fg = gilt_mid },
                    ["@lsp.type.interface.cs"] = { fg = gilt_mid },
                    ["@lsp.type.enum.cs"] = { fg = gilt_mid },
                    ["@lsp.type.enumMember.cs"] = { fg = briar_bright },
                    ["@lsp.type.namespace.cs"] = { fg = gilt_bright },
                    ["@lsp.type.method.cs"] = { fg = circuit_bright },
                    ["@lsp.type.property.cs"] = { fg = arcane_mid },
                    ["@lsp.type.decorator.cs"] = { fg = gilt_mid },
                    ["@lsp.mod.static.cs"] = { fg = briar_mid },
                    ["@lsp.type.class.java"] = { fg = gilt_mid },
                    ["@lsp.type.interface.java"] = { fg = gilt_mid },
                    ["@lsp.type.enum.java"] = { fg = gilt_mid },
                    ["@lsp.type.enumMember.java"] = { fg = briar_bright },
                    ["@lsp.type.method.java"] = { fg = circuit_bright },
                    ["@lsp.type.annotation.java"] = { fg = gilt_mid },
                    ["@lsp.type.namespace.java"] = { fg = gilt_bright },

                    -- Rust
                    ["@keyword.rust"] = { fg = arcane_bright },
                    ["@type.rust"] = { fg = gilt_mid },
                    ["@lsp.type.struct.rust"] = { fg = gilt_mid },
                    ["@lsp.type.enum.rust"] = { fg = gilt_mid },
                    ["@lsp.type.enumMember.rust"] = { fg = briar_bright },
                    ["@lsp.type.macro.rust"] = { fg = circuit_mid },
                    ["@lsp.type.lifetime.rust"] = { fg = briar_mid },
                    ["@lsp.type.interface.rust"] = { fg = gilt_mid },
                    ["@lsp.type.typeParameter.rust"] = { fg = gilt_mid },
                    ["@lsp.mod.mutable.rust"] = { fg = text_rune },
                    ["@lsp.mod.consuming.rust"] = { fg = briar_mid },

                    -- Lua
                    ["@keyword.lua"] = { fg = arcane_bright },
                    ["@function.call.lua"] = { fg = circuit_bright },
                    ["@variable.member.lua"] = { fg = arcane_mid },
                    ["@lsp.type.class.lua"] = { fg = gilt_mid },

                    -- CSS / SCSS
                    ["@property.css"] = { fg = arcane_mid },
                    ["@property.scss"] = { fg = arcane_mid },
                    ["@number.css"] = { fg = gilt_bright },
                    ["@string.css"] = { fg = thorn_bright },
                    ["@keyword.css"] = { fg = arcane_bright },
                    ["@keyword.scss"] = { fg = arcane_bright },
                    ["@type.css"] = { fg = circuit_mid },
                    ["@variable.css"] = { fg = briar_mid },
                    ["@variable.scss"] = { fg = briar_mid },

                    -- HTML
                    ["@tag.html"] = { fg = briar_mid },
                    ["@tag.attribute.html"] = { fg = arcane_mid },
                    ["@string.html"] = { fg = thorn_bright },

                    -- JSON / YAML / TOML
                    ["@property.json"] = { fg = circuit_bright },
                    ["@label.json"] = { fg = circuit_bright },
                    ["@string.json"] = { fg = thorn_bright },
                    ["@number.json"] = { fg = gilt_bright },
                    ["@boolean.json"] = { fg = arcane_bright },
                    ["@constant.json"] = { fg = arcane_bright },
                    ["@property.yaml"] = { fg = circuit_mid },
                    ["@string.yaml"] = { fg = thorn_bright },
                    ["@number.yaml"] = { fg = gilt_bright },
                    ["@boolean.yaml"] = { fg = arcane_bright },
                    ["@property.toml"] = { fg = arcane_mid },
                    ["@string.toml"] = { fg = thorn_bright },
                    ["@number.toml"] = { fg = gilt_bright },

                    -- Bash / Shell
                    ["@keyword.bash"] = { fg = arcane_bright },
                    ["@function.bash"] = { fg = circuit_bright },
                    ["@variable.bash"] = { fg = text_rune },
                    ["@string.bash"] = { fg = thorn_bright },
                    ["@number.bash"] = { fg = gilt_bright },
                    ["@constant.bash"] = { fg = briar_bright },
                    ["@operator.bash"] = { fg = circuit_mid },
                    ["@punctuation.special.bash"] = { fg = circuit_mid },

                    -- ── Diagnostics ────────────────────────────────────
                    DiagnosticError = { fg = briar_bright },
                    DiagnosticWarn = { fg = gilt_bright },
                    DiagnosticInfo = { fg = circuit_bright },
                    DiagnosticHint = { fg = thorn_bright },
                    DiagnosticOk = { fg = thorn_bright },
                    DiagnosticVirtualTextError = { fg = briar_mid, italic = true },
                    DiagnosticVirtualTextWarn = { fg = gilt_mid, italic = true },
                    DiagnosticVirtualTextInfo = { fg = circuit_dim, italic = true },
                    DiagnosticVirtualTextHint = { fg = thorn_mid, italic = true },
                    DiagnosticUnderlineError = { undercurl = true, sp = briar_bright },
                    DiagnosticUnderlineWarn = { undercurl = true, sp = gilt_bright },
                    DiagnosticUnderlineInfo = { undercurl = true, sp = circuit_bright },
                    DiagnosticUnderlineHint = { undercurl = true, sp = thorn_bright },

                    -- ── Git signs ──────────────────────────────────────
                    GitSignsAdd = { fg = thorn_bright },
                    GitSignsChange = { fg = gilt_bright },
                    GitSignsDelete = { fg = briar_bright },
                    DiffAdd = { bg = "#042D1C" }, -- thorn.deep
                    DiffChange = { bg = "#3D2B00" }, -- gilt.deep
                    DiffDelete = { bg = "#3D0A1C" }, -- briar.deep
                    DiffText = { bg = "#7A5800" }, -- gilt.dim

                    -- ── Telescope ──────────────────────────────────────
                    TelescopeBorder = { fg = arcane_mid },
                    TelescopePromptBorder = { fg = circuit_dim },
                    TelescopeResultsBorder = { fg = bg_overlay },
                    TelescopePreviewBorder = { fg = bg_overlay },
                    TelescopeSelection = { bg = bg_raised, fg = text_rune },
                    TelescopeMatching = { fg = gilt_bright },
                    TelescopePromptPrefix = { fg = circuit_bright },

                    -- ── nvim-cmp ───────────────────────────────────────
                    CmpItemAbbr = { fg = text_vellum },
                    CmpItemAbbrMatch = { fg = gilt_bright },
                    CmpItemAbbrMatchFuzzy = { fg = gilt_mid },
                    CmpItemMenu = { fg = text_faded },
                    CmpItemKindFunction = { fg = circuit_bright },
                    CmpItemKindMethod = { fg = circuit_bright },
                    CmpItemKindKeyword = { fg = arcane_bright },
                    CmpItemKindVariable = { fg = text_rune },
                    CmpItemKindField = { fg = arcane_mid },
                    CmpItemKindProperty = { fg = arcane_mid },
                    CmpItemKindType = { fg = gilt_mid },
                    CmpItemKindClass = { fg = gilt_mid },
                    CmpItemKindInterface = { fg = gilt_mid },
                    CmpItemKindEnum = { fg = gilt_mid },
                    CmpItemKindEnumMember = { fg = briar_bright },
                    CmpItemKindConstant = { fg = briar_bright },
                    CmpItemKindString = { fg = thorn_bright },
                    CmpItemKindModule = { fg = gilt_bright },

                    -- ── Which-key ──────────────────────────────────────
                    WhichKey = { fg = arcane_bright },
                    WhichKeyGroup = { fg = gilt_bright },
                    WhichKeyDesc = { fg = text_vellum },
                    WhichKeySep = { fg = text_specter },
                    WhichKeyBorder = { fg = bg_overlay },
                    WhichKeyFloat = { bg = bg_raised },

                    -- ── Indent guides (mini.indentscope / snacks) ──────
                    MiniIndentscopeSymbol = { fg = bg_overlay },
                    IblIndent = { fg = bg_overlay },
                    IblScope = { fg = arcane_dim },
                }
            end,

            default_integrations = true,
            auto_integrations = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                snacks = {
                    enabled = true,
                    indent_scope_color = "",
                },
            },
        },
    },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     opts = {
    --         flavour = "mocha", -- latte, frappe, macchiato, mocha
    --         background = { -- :h background
    --             light = "latte",
    --             dark = "mocha",
    --         },
    --         transparent_background = true, -- disables setting the background color.
    --         float = {
    --             transparent = true, -- enable transparent floating windows
    --             solid = false, -- use solid styling for floating windows, see |winborder|
    --         },
    --         show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    --         term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    --         dim_inactive = {
    --             enabled = false, -- dims the background color of inactive window
    --             shade = "dark",
    --             percentage = 0.15, -- percentage of the shade to apply to the inactive window
    --         },
    --         no_italic = true, -- Force no italic
    --         no_bold = true, -- Force no bold
    --         no_underline = false, -- Force no underline
    --         styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    --             comments = { "italic" }, -- Change the style of comments
    --             conditionals = { "italic" },
    --             loops = {},
    --             functions = {},
    --             keywords = {},
    --             strings = {},
    --             variables = {},
    --             numbers = {},
    --             booleans = {},
    --             properties = {},
    --             types = {},
    --             operators = {},
    --             -- miscs = {}, -- Uncomment to turn off hard-coded styles
    --         },
    --         lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
    --             virtual_text = {
    --                 errors = { "italic" },
    --                 hints = { "italic" },
    --                 warnings = { "italic" },
    --                 information = { "italic" },
    --                 ok = { "italic" },
    --             },
    --             underlines = {
    --                 errors = { "underline" },
    --                 hints = { "underline" },
    --                 warnings = { "underline" },
    --                 information = { "underline" },
    --                 ok = { "underline" },
    --             },
    --             inlay_hints = {
    --                 background = true,
    --             },
    --         },
    --         color_overrides = {
    --             mocha = {
    --                 -- Exquisite theme
    --                 base = "#050517",
    --                 mantle = "#0a0a2e",
    --                 crust = "#030310",
    --                 surface0 = "#15153a",
    --                 surface1 = "#1a1a45",
    --                 surface2 = "#202050",
    --
    --                 text = "#fcffb8",
    --                 subtext1 = "#e6e9a5",
    --                 subtext0 = "#d0d392",
    --                 overlay2 = "#babd7f",
    --                 overlay1 = "#a5a76c",
    --                 overlay0 = "#8f9159",
    --
    --                 -- 16 terminal colors (Exquisite)
    --                 black = "#626483",
    --                 red = "#fb007a",
    --                 green = "#a6e22e",
    --                 yellow = "#f3e430",
    --                 blue = "#58AFC2",
    --                 magenta = "#583794",
    --                 cyan = "#926BCA",
    --                 white = "#d9d9d9",
    --
    --                 -- Extended palette (Exquisite + UI accents)
    --                 rosewater = "#f1f1f1",
    --                 lavender = "#8897F4",
    --                 sapphire = "#58AFC2",
    --                 sky = "#79E6F3",
    --                 teal = "#58AFC2",
    --                 peach = "#F2A272",
    --                 maroon = "#F37F97",
    --                 flamingo = "#C574DD",
    --                 mauve = "#C574DD",
    --                 pink = "#FF4971",
    --             },
    --         },
    --         custom_highlights = function(colors)
    --             return {
    --                 Normal = { bg = colors.none },
    --                 NormalNC = { bg = colors.none },
    --                 NormalFloat = { bg = colors.none },
    --                 FloatBorder = { bg = colors.none },
    --                 CursorLine = { bg = colors.none },
    --             }
    --         end,
    --         default_integrations = true,
    --         auto_integrations = true,
    --         integrations = {
    --             cmp = true,
    --             gitsigns = true,
    --             nvimtree = true,
    --             notify = false,
    --             mini = {
    --                 enabled = true,
    --                 indentscope_color = "",
    --             },
    --             snacks = {
    --                 enabled = true,
    --                 indent_scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
    --             },
    --             -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    --         },
    --     },
    -- },

    -- {
    --     "wtfox/jellybeans.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {}, -- Optional
    -- },

    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            -- Alternatively set style in setup
            -- style = 'light'

            -- Enable transparent background
            transparent = true,

            -- Enable italic comment
            italic_comments = true,

            -- Enable italic inlay type hints
            italic_inlayhints = true,

            -- Underline `@markup.link.*` variants
            underline_links = true,

            -- Disable nvim-tree background color
            disable_nvimtree_bg = true,

            -- Apply theme colors to terminal
            terminal_colors = true,

            -- Override colors (see ./lua/vscode/colors.lua)
            color_overrides = {
                -- vscLineNumber = "#FFFFFF",
            },

            -- Override highlight groups (see ./lua/vscode/theme.lua)
            group_overrides = {
                -- this supports the same val table as vim.api.nvim_set_hl
                -- use colors from this colorscheme by requiring vscode.colors!
                -- Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
            },
        },
    },

    -- kanagawa
    -- {
    --     "rebelot/kanagawa.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {
    --         compile = false, -- enable compiling the colorscheme
    --         undercurl = false, -- enable undercurls
    --         commentStyle = { italic = true },
    --         functionStyle = {},
    --         keywordStyle = { italic = true },
    --         statementStyle = { bold = true },
    --         typeStyle = {},
    --         transparent = true, -- do not set background color
    --         dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    --         terminalColors = true, -- define vim.g.terminal_color_{0,17}
    --         colors = { -- add/modify theme and palette colors
    --             palette = {},
    --             theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    --         },
    --         overrides = function(colors) -- add/modify highlights
    --             return {}
    --         end,
    --         theme = "wave", -- Load "wave" theme
    --         background = { -- map the value of 'background' option to a theme
    --             dark = "wave", -- try "dragon" !
    --             light = "lotus",
    --         },
    --     },
    -- },
}
