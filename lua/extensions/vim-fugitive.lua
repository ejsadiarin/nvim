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
    keys = {
        { "<leader>G", "<CMD>tab Git<CR>", desc = "Open [G]it Fugitive" },
        { "<leader>C", "<CMD>tab Git commit | startinsert<CR>", desc = "Git [C]ommit" },
    },
}
