-- Colorscheme:
-- --> Monokai
-- --> Jellybeans
-- --> Tokyo Night

return {
    -- WARN: THIS IS A VERY HEAVILY CUSTOMIZED MONOKAI
    {
        "loctvl842/monokai-pro.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent_background = true,
            terminal_colors = true,
            devicons = false, -- highlight the icons of `nvim-web-devicons`
            styles = {
                comment = { italic = true },
                keyword = { italic = true }, -- any other keyword
                type = { italic = true }, -- (preferred) int, long, char, etc
                storageclass = { italic = true }, -- static, register, volatile, etc
                structure = { italic = true }, -- struct, union, enum, etc
                parameter = { italic = true }, -- parameter pass in function
                annotation = { italic = true },
                tag_attribute = { italic = true }, -- attribute of tag in reactjs
            },
            filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
            -- Enable this will disable filter option
            day_night = {
                enable = false, -- turn off by default
                day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
                night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
            },
            inc_search = "background", -- underline | background
            background_clear = {
                "float_win",
                "toggleterm",
                "telescope",
                "which-key",
                -- 'renamer',
                "notify",
                -- "nvim-tree",
                "neo-tree",
                "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
            }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
            plugins = {
                bufferline = {
                    underline_selected = false,
                    underline_visible = false,
                },
                indent_blankline = {
                    context_highlight = "default", -- default | pro
                    context_start_underline = false,
                },
            },
            ---@param cs Colorscheme
            ---@param p ColorschemeOptions
            ---@param Config MonokaiProOptions
            ---@param hp Helper
            -- override = function(cs: Colorscheme, p: ColorschemeOptions, Config: MonokaiProOptions, hp: Helper) end,
            ---@param filter "classic" | "machine" | "octagon" | "pro" | "ristretto" | "spectrum"
            overridePalette = function(filter)
                return {
                    -- Background and text colors
                    dark2 = "#161b1e", -- Deep background color (darkest)
                    dark1 = "#1d2528", -- Slightly lighter background
                    background = "#273136", -- Main background color
                    text = "#fcffb8", -- Primary text color
                    -- text = '#f2fffc',       -- Primary text color
                    accent1 = "#c24c5a", -- Red accent (functions)
                    -- accent1 = '#ff6d7e',    -- Red accent (functions)
                    accent2 = "#ffb270", -- Orange accent (parameter)
                    accent3 = "#f9cc6c", -- Yellow accent (strings)
                    -- accent3 = '#fabd2f',    -- Yellow accent
                    -- accent4 = '#97e522',    -- Green accent
                    accent4 = "#a2e57b", -- Green accent
                    -- accent5 = '#83a598', -- Blue accent
                    -- accent5 = '#4aa4bf', -- Blue accent
                    accent5 = "#7cd5f1",
                    accent6 = "#baa0f8", -- Purple accent (for booleans,  etc.)
                    dimmed1 = "#b8bcb9", -- Light gray
                    dimmed2 = "#8b9798", -- Medium-light gray
                    dimmed3 = "#6b7678", -- Medium gray
                    dimmed4 = "#545f62", -- Medium-dark gray
                    dimmed5 = "#1e1e1e", -- Dark gray
                }
            end,
            override = function()
                return {
                    Normal = { fg = "#fcffb8", bg = "NONE" }, -- #19171a
                    CursorLine = { bg = "#1d1e24" },
                    CursorLineNr = { fg = "#fcef0b" },
                    -- CursorLineNr = { fg = "#b8bcb9" },
                    Cursor = { fg = "#fcef0b", bg = "#fcef0b" },
                    NormalFloat = { bg = "NONE" },
                    FloatTitle = { bg = "NONE" },
                    FloatFooter = { bg = "NONE" },
                    -- FloatTitle = { bg = "#f9cc6c" },
                    -- FloatFooter = { bg = "#f9cc6c" },
                    FloatBorder = { fg = "#425157" },
                    Directory = { fg = "#f9cc6c" },
                    SignColumn = { bg = "NONE" },
                    Comment = { bg = "NONE" },

                    ["@lsp.type.namespace.go"] = { fg = "#be7be5" },
                    -- ["@lsp.type.namespace.go"] = { fg = "#b8bcb9" },
                    -- ['@lsp.type.namespace.go'] = { fg = '#fcffb8' },
                    Function = { fg = "#ff6d7e" },
                    -- Todo = { fg = "#222a2d" },
                    TodoBgNOTE = { bg = "#7cd5f1", fg = "#222a2d", bold = true },
                    TodoBgTODO = { bg = "#7cd5f1", fg = "#222a2d", bold = true },
                    TodoBgWARN = { bg = "#ffb270", fg = "#222a2d", bold = true },
                    TodoBgPERF = { bg = "#fcffb8", fg = "#222a2d", bold = true },
                    TodoBgHACK = { bg = "#ffb270", fg = "#222a2d", bold = true },
                    TodoBgFIX = { bg = "#c24c5a", fg = "#fcffb8", bold = true },
                    yamlBlockMappingKey = { fg = "#c24c5a" },

                    MarkViewCode = { bg = "#141421" },
                    MarkViewInlineCode = { bg = "#141421" },

                    -- LazyNormal = { fg = '#909c9d', bg = '#222a2d' },
                    LazyNormal = { fg = "#f2fffc", bg = "NONE" },
                    LazyButton = { bg = "#1d1e24" },

                    StatusLine = { bg = "NONE" },
                    SnippetTabstop = { bg = "NONE" },

                    BlinkCmpKindMethod = { fg = "#a2e57b" },
                    BlinkCmpKindFunction = { fg = "#a2e57b" },

                    -- FzfLuaTitle = { bg = "#1d1e24" },

                    TelescopeNormal = { fg = "#f2fffc" },
                    TelescopeResultsNormal = { fg = "#f2fffc" },
                    TelescopeResultsFunction = { fg = "#f9cc6c", bg = "#1d1e24" },
                    TelescopeResultsTitle = { bg = "#f9cc6c" },
                    TelescopePromptTitle = { bg = "#f9cc6c" },
                    TelescopePreviewTitle = { bg = "#f9cc6c" },

                    GrappleTitle = { fg = "#f2fffc", bg = "#1d1e24" },
                    GrappleFooter = { fg = "#f2fffc", bg = "#1d1e24" },

                    SnacksScratchTitle = { fg = "#f2fffc", bg = "#1d1e24" },
                    SnacksScratchFooter = { fg = "#f2fffc", bg = "#1d1e24" },

                    -- SnacksNormal = { bg = "NONE" },
                    -- SnacksWinBar = { bg = "NONE" },
                    -- SnacksBackdrop = { bg = "NONE" },
                    -- SnacksNormalNC = { bg = "NONE" },
                    -- SnacksWinBarNC = { bg = "NONE" },
                    -- SnacksNotifierInfo = { bg = "NONE" },
                    -- SnacksNotifierWarn = { bg = "NONE" },
                    -- SnacksNotifierDebug = { bg = "NONE" },
                    -- SnacksNotifierError = { bg = "NONE" },
                    -- SnacksNotifierTrace = { bg = "NONE" },
                    -- SnacksNotifierHistory = { bg = "NONE" },
                    -- SnacksNotifierIconInfo = { bg = "NONE" },
                    -- SnacksNotifierIconWarn = { bg = "NONE" },
                    -- SnacksNotifierIconDebug = { bg = "NONE" },
                    -- SnacksNotifierIconError = { bg = "NONE" },
                    -- SnacksNotifierIconTrace = { bg = "NONE" },
                    -- SnacksNotifierTitleInfo = { bg = "NONE" },
                    -- SnacksNotifierTitleWarn = { bg = "NONE" },
                    -- SnacksNotifierBorderInfo = { bg = "NONE" },
                    -- SnacksNotifierBorderWarn = { bg = "NONE" },
                    -- SnacksNotifierFooterInfo = { bg = "NONE" },
                    -- SnacksNotifierFooterWarn = { bg = "NONE" },
                    -- SnacksNotifierTitleDebug = { bg = "NONE" },
                    -- SnacksNotifierTitleError = { bg = "NONE" },
                    -- SnacksNotifierTitleTrace = { bg = "NONE" },
                    -- SnacksNotifierBorderDebug = { bg = "NONE" },
                    -- SnacksNotifierBorderError = { bg = "NONE" },
                    -- SnacksNotifierBorderTrace = { bg = "NONE" },
                    -- SnacksNotifierFooterDebug = { bg = "NONE" },
                    -- SnacksNotifierFooterError = { bg = "NONE" },
                    -- SnacksNotifierFooterTrace = { bg = "NONE" },
                    -- SnacksNotifierHistoryTitle = { bg = "NONE" },
                    -- SnacksNotifierHistoryDateTime = { bg = "NONE" },

                    lualine_a_normal = { bg = "#1e1e1e" },

                    ["@markup.raw.block.markdown"] = { bg = "NONE" },
                    ["@markup.raw.markdown_inline"] = { bg = "NONE" },

                    BufferLineBackground = { bg = "NONE" },
                    BufferLineSeparator = { bg = "NONE" },
                    BufferLineTab = { bg = "NONE" },
                    BufferLineWarning = { bg = "NONE" },
                    BufferLineError = { bg = "NONE" },
                    BufferLinePick = { bg = "NONE" },
                    BufferLineInfo = { bg = "NONE" },
                    BufferLineHint = { bg = "NONE" },
                    BufferLineModified = { bg = "NONE" },
                    BufferLineCloseButton = { bg = "NONE" },
                    BufferLineIndicator = { bg = "NONE" },
                    BufferLineDuplicate = { bg = "NONE" },

                    BufferLineDevIconGoModInactive = { bg = "NONE" },
                    BufferLineDevIconEnvInactive = { bg = "NONE" },
                    BufferLineDevIconGoInactive = { bg = "NONE" },
                    BufferLineDevIconGoMod = { bg = "NONE" },
                    BufferLineDevIconGo = { bg = "NONE" },
                    BufferLineDevIconEnv = { bg = "NONE" },

                    BufferLineBufferSelected = { bg = "NONE" },
                    BufferLineModifiedIcon = { bg = "NONE" },
                    BufferLineIndicatorSelected = { bg = "NONE" },
                    BufferLineModifiedSelected = { bg = "NONE" },
                    BufferLineBuffer = { bg = "NONE" },

                    BufferLineDevIconLuaSelected = { bg = "NONE" },
                    BufferLineDevIconDefaultSelected = { bg = "NONE" },

                    BufferLineGroupLabel = { bg = "NONE" },
                    BufferLineDevIconLua = { bg = "NONE" },
                    BufferLineErrorDiagnostic = { bg = "NONE" },
                    BufferLineInfoDiagnostic = { bg = "NONE" },
                    BufferLineHintDiagnostic = { bg = "NONE" },
                    BufferLineDevIconDefault = { bg = "NONE" },
                    BufferLineTabSeparator = { bg = "NONE" },
                    BufferLineWarningDiagnostic = { bg = "NONE" },
                    BufferLineDevIconLuaInactive = { bg = "NONE" },
                    BufferLineDevIconDefaultInactive = { bg = "NONE" },

                    BufferLineHintVisible = { bg = "NONE" },
                    BufferLineInfoVisible = { bg = "NONE" },
                    BufferLinePickVisible = { bg = "NONE" },
                    BufferLineErrorVisible = { bg = "NONE" },
                    BufferLineBufferVisible = { bg = "NONE" },
                    BufferLineNumbersVisible = { bg = "NONE" },
                    BufferLineWarningVisible = { bg = "NONE" },
                    BufferLineModifiedVisible = { bg = "NONE" },
                    BufferLineDuplicateVisible = { bg = "NONE" },
                    BufferLineIndicatorVisible = { bg = "NONE" },
                    BufferLineSeparatorVisible = { bg = "NONE" },
                    BufferLineDiagnosticVisible = { bg = "NONE" },
                    BufferLineCloseButtonVisible = { bg = "NONE" },
                    BufferLineHintDiagnosticVisible = { bg = "NONE" },
                    BufferLineInfoDiagnosticVisible = { bg = "NONE" },
                    BufferLineErrorDiagnosticVisible = { bg = "NONE" },
                    BufferLineWarningDiagnosticVisible = { bg = "NONE" },
                }
            end,
        },
    },
    {
        "wtfox/jellybeans.nvim",
        lazy = false,
        priority = 1000,
        opts = {}, -- Optional
    },
}
