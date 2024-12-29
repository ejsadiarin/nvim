return {
    "tpope/vim-fugitive",
    opts = {},
    config = function()
        -- vim.api.nvim_create_autocmd("FileType", {
        --     vim.api.nvim_create_augroup("FugitiveMappings", { clear = true }),
        --     pattern = "fugitive",
        --     callback = function()
        --         vim.keymap.set("n", "a", , opts?)
        --     end,
        -- })
    end,
}
