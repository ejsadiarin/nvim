local function toggle_diffview(cmd)
    if next(require("diffview.lib").views) == nil then
        vim.cmd(cmd)
    else
        vim.cmd("DiffviewClose")
    end
end

return {
    "sindrets/diffview.nvim",
    lazy = false,
    command = "DiffviewOpen",
    keys = {
        {
            "<leader>gd",
            function()
                toggle_diffview("DiffviewOpen")
            end,
            desc = "git [d]iff this file",
        },
        {
            "<leader>gD",
            function()
                toggle_diffview("DiffviewOpen master..HEAD")
            end,
            desc = "git [D]iff master (HEAD)",
        },
        {
            "<leader>gF",
            function()
                toggle_diffview("DiffviewFileHistory %")
            end,
            desc = "Diffview Current [F]ile History",
        },
    },
}
