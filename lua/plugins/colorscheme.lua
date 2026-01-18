-- Colorscheme:
-- --> Catppuccin
-- --> Monokai
-- --> Jellybeans
-- --> Tokyo Night

return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "monokai-pro",
        },
    },
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
                    background = "#273136", -- Main background color
                    dark1 = "#1d2528", -- Slightly lighter background
                    dark2 = "#161b1e", -- Deep background color (darkest)
                    text = "#fcffb8", -- Primary text color
                    -- text = '#f2fffc',       -- Primary text color
                    -- accent1 = "#c24c5a", -- Red accent (functions)
                    accent1 = "#ff6d7e", -- Red accent (functions)
                    accent2 = "#ffb270", -- Orange accent (parameter)
                    -- accent3 = "#90ee90", -- Yellow accent (strings)
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
                    -- Identifier = { fg = "#fcffb8", bg = "NONE" },
                    -- Identifier = { fg = "#ffffff", bg = "NONE" }, -- #19171a
                    CursorLine = { bg = "#1d1e24" },
                    CursorLineNr = { fg = "#fcef0b" },
                    -- CursorLineNr = { fg = "#b8bcb9" },
                    Cursor = { fg = "#fcef0b", bg = "#fcef0b" },
                    NormalFloat = { bg = "#161b1e" }, -- Set a solid background for floating windows
                    FloatBorder = { fg = "#425157", bg = "#161b1e" }, -- Ensure border is visible with a solid background
                    Directory = { fg = "#f9cc6c" },
                    SignColumn = { fg = "NONE", bg = "NONE" },
                    Comment = { bg = "NONE" },

                    SnacksIndentScope = { fg = "#555555" },
                    SnacksIndent = { fg = "#222a2d" },
                    SnacksDim = { link = "Conceal " },

                    -- For DBUI (vim-dadbod-ui)
                    NotificationInfo = { bg = "NONE" },
                    NotificationWarning = { bg = "NONE" },
                    NotificationError = { bg = "NONE" },

                    -- NOTE: for Go syntax
                    ["@lsp.type.namespace.go"] = { fg = "#b8bcb9" },
                    -- func keyword (same)
                    ["@lsp.type.keyword.go"] = { fg = "#7cd5f1" },
                    ["@keyword.function.go"] = { fg = "#7cd5f1" },
                    --
                    ["@function"] = { fg = "#a2e57b" }, -- #fcffb8
                    -- ["@string"] = { fg = "#e6db74" },
                    -- ["@property.yaml"] = { fg = "#2EF0E9" },
                    -- ["@string.yaml"] = { fg = "#90ee90" },
                    ["@keyword"] = { fg = "#fcef0b" },
                    ["@punctuation.bracket"] = { fg = "#fcffb8" },

                    -- ["@lsp.type.namespace.go"] = { fg = "#be7be5" },
                    -- ['@lsp.type.namespace.go'] = { fg = '#fcffb8' },
                    -- ["@keyword.function.lua"] = { fg = "#fcef0b" },
                    Function = { fg = "#ff6d7e" },
                    -- Todo = { bg = "#7cd5f1", fg = "#222a2d", bold = true },
                    TodoBgNOTE = { bg = "NONE", fg = "#7cd5f1", bold = true },
                    TodoBgTODO = { bg = "NONE", fg = "#7cd5f1", bold = true },
                    TodoBgWARN = { bg = "NONE", fg = "#ffb270", bold = true },
                    TodoBgPERF = { bg = "NONE", fg = "#fcffb8", bold = true },
                    TodoBgHACK = { bg = "NONE", fg = "#ffb270", bold = true },
                    TodoBgFIX = { bg = "NONE", fg = "#c24c5a", bold = true },
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

                    -- Avante.nvim
                    AvanteTitle = { fg = "#273136", bg = "#a2e57b" }, -- background / accent4
                    AvanteReversedTitle = { fg = "#a2e57b" },
                    AvanteSubtitle = { fg = "#273136", bg = "#7cd5f1" }, -- background / accent5
                    AvanteReversedSubtitle = { fg = "#7cd5f1" },
                    AvanteThirdTitle = { fg = "#b8bcb9", bg = "#1e1e1e" }, -- dimmed1 / dimmed5
                    AvanteReversedThirdTitle = { fg = "#6b7678" }, -- dimmed3

                    avantepopuphint = { bg = "#1d2528" }, -- dark1
                    avanteinlinehint = { fg = "#7cd5f1" }, -- accent5

                    -- Sidebar needs a background if transparent is on
                    AvanteSidebarNormal = { bg = "#161b1e" }, -- dark2

                    -- Input area
                    AvantePromptInput = { bg = "#1d1e24" }, -- CursorLine bg
                    AvantePromptInputBorder = { fg = "#6b7678" }, -- dimmed3

                    -- Diff/Conflict
                    AvanteConflictCurrent = { bg = "#562C30", bold = true },
                    AvanteConflictIncoming = { bg = "#314753", bold = true },
                }
            end,
        },
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- disables setting the background color.
            float = {
                transparent = false, -- enable transparent floating windows
                solid = false, -- use solid styling for floating windows, see |winborder|
            },
            show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
            term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            no_underline = false, -- Force no underline
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
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
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
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
            color_overrides = {
                mocha = {
                    -- this 16 colors are changed to onedark
                    -- this 16 colors are changed to catppuccin mocha
                    -- base = "#1e1e2e",
                    base = "#050517",
                    mantle = "#181825",
                    surface0 = "#313244",
                    surface1 = "#45475a",
                    surface2 = "#585b70",
                    text = "#cdd6f4",

                    black = "#626483",
                    red = "#fb007a",
                    green = "#a6e22e",
                    yellow = "#f3e430",
                    blue = "#58AFC2",
                    magenta = "#583794",
                    cyan = "#926BCA",
                    white = "#d9d9d9",

                    rosewater = "#f5e0dc",
                    lavender = "#b4befe",

                    -- red = "#fb007a",
                    -- yellow = "#f3e430",
                    -- green = "#a6e22e",
                    -- blue = "#89b4fa",
                    peach = "#fab387",
                    teal = "#94e2d5",
                    mauve = "#cba6f7",
                    flamingo = "#f2cdcd",

                    -- now patching extra palettes
                    maroon = "#eba0ac",
                    sky = "#89dceb",

                    -- extra colors
                    pink = "#f5c2e7",
                    sapphire = "#74c7ec",

                    subtext1 = "#bac2de",
                    subtext0 = "#a6adc8",
                    overlay2 = "#9399b2",
                    overlay1 = "#7f849c",
                    overlay0 = "#6c7086",

                    crust = "#11111b",
                },
            },
            custom_highlights = {},
            default_integrations = true,
            auto_integrations = false,
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
                    indent_scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                },
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        },
    },

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
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            compile = false, -- enable compiling the colorscheme
            undercurl = false, -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = true, -- do not set background color
            dimInactive = false, -- dim inactive window `:h hl-NormalNC`
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            colors = { -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors) -- add/modify highlights
                return {}
            end,
            theme = "wave", -- Load "wave" theme
            background = { -- map the value of 'background' option to a theme
                dark = "wave", -- try "dragon" !
                light = "lotus",
            },
        },
    },
}
