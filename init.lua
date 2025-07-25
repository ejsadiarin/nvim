local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- #################
-- #     LAZY      #
-- #################
-- if pcall(require, "lazyvim") then
--     package.loaded["lazyvim.config.options"] = false -- disable default lazyvim options
-- end
require("lazy").setup({
    spec = {
        -- add LazyVim and import its plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        -- langs
        { import = "lazyvim.plugins.extras.lang.go" },
        -- { import = "lazyvim.plugins.extras.lang.java" }, -- NOTE: somehow { import = "extensions.java" } works, see below
        -- { import = "lazyvim.plugins.extras.lang.yaml" },
        -- { import = "lazyvim.plugins.extras.lang.ansible" },
        { import = "lazyvim.plugins.extras.lang.docker" },
        { import = "lazyvim.plugins.extras.lang.typescript" },
        { import = "lazyvim.plugins.extras.lang.tailwind" },
        { import = "lazyvim.plugins.extras.lang.clangd" },
        { import = "lazyvim.plugins.extras.dap.core" },
        { import = "lazyvim.plugins.extras.test.core" },
        { import = "lazyvim.plugins.extras.coding.luasnip" },
        -- import/override with your plugins
        { import = "plugins" },
        -- optional plugins
        -- { import = "extensions.obsidian" },
        { import = "extensions.tmux-navigator" },
        { import = "extensions.codecompanion" },
        { import = "extensions.copilot" },
        -- { import = "extensions.avante" },
        { import = "extensions.vim-fugitive" },
        { import = "extensions.colorizer" },
        { import = "extensions.kulala" },
        -- { import = "extensions.rest" }, -- NOTE: requires luarocks and lua-5.1/lua5.1 (compat-lua) installed on machine
        -- { import = "extensions.presence" },
        { import = "extensions.data-engineering.sql" },
        { import = "extensions.data-engineering.python" },
        { import = "extensions.diffview" },
        { import = "extensions.devops" },
        { import = "extensions.cloak" },
        { import = "extensions.java" },
        -- { import = "extensions.telescope" },
        -- { import = "extensions.fzf-lua" },
        -- { import = "extensions.image" },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    ui = {
        border = "rounded",
    },
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = {
        enabled = true, -- check for plugin updates periodically
        notify = false, -- notify on update
    }, -- automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    -- rocks = {
    --     enabled = true,
    --     hererocks = true,
    -- },
})
