return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "monokai-pro",
            defaults = {
                autocmds = true,
                keymaps = true,
                -- options = false,
                -- NOTE: default options are disabled inside "init.lua"
                -- on: package.loaded["lazyvim.config.options"] = true -- disable default lazyvim options
            },
            news = {
                -- When enabled, NEWS.md will be shown when changed.
                -- This only contains big new features and breaking changes.
                lazyvim = true,
                -- Same but for Neovim's news.txt
                neovim = false,
            },
          -- icons used by other plugins
          -- stylua: ignore
          icons = {
            misc = {
              dots = "󰇘",
            },
            ft = {
              octo = "",
            },
            dap = {
              Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
              Breakpoint          = " ",
              BreakpointCondition = " ",
              BreakpointRejected  = { " ", "DiagnosticError" },
              LogPoint            = ".>",
            },
            diagnostics = {
              Error = " ",
              Warn  = " ",
              Hint  = " ",
              Info  = " ",
            },
            git = {
              added    = " ",
              modified = " ",
              removed  = " ",
            },
            kinds = {
              Array         = " ",
              Boolean       = "󰨙 ",
              Class         = " ",
              Codeium       = "󰘦 ",
              Color         = " ",
              Control       = " ",
              Collapsed     = " ",
              Constant      = "󰏿 ",
              Constructor   = " ",
              Copilot       = " ",
              Enum          = " ",
              EnumMember    = " ",
              Event         = " ",
              Field         = " ",
              File          = " ",
              Folder        = " ",
              Function      = "󰊕 ",
              Interface     = " ",
              Key           = " ",
              Keyword       = " ",
              Method        = "󰊕 ",
              Module        = " ",
              Namespace     = "󰦮 ",
              Null          = " ",
              Number        = "󰎠 ",
              Object        = " ",
              Operator      = " ",
              Package       = " ",
              Property      = " ",
              Reference     = " ",
              Snippet       = "󱄽 ",
              String        = " ",
              Struct        = "󰆼 ",
              Supermaven    = " ",
              TabNine       = "󰏚 ",
              Text          = " ",
              TypeParameter = " ",
              Unit          = " ",
              Value         = " ",
              Variable      = "󰀫 ",
            },
          },
            ---@type table<string, string[]|boolean>?
            kind_filter = {
                default = {
                    "Class",
                    "Constructor",
                    "Enum",
                    "Field",
                    "Function",
                    "Interface",
                    "Method",
                    "Module",
                    "Namespace",
                    "Package",
                    "Property",
                    "Struct",
                    "Trait",
                },
                markdown = false,
                help = false,
                -- you can specify a different filter for each filetype
                lua = {
                    "Class",
                    "Constructor",
                    "Enum",
                    "Field",
                    "Function",
                    "Interface",
                    "Method",
                    "Module",
                    "Namespace",
                    -- "Package", -- remove package since luals uses it for control flow structures
                    "Property",
                    "Struct",
                    "Trait",
                },
            },
        },
    },
}
