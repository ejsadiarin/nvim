vim.g.tmux_navigator_no_mappings = 1
return {
    -- Tmux Navigation
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<A-h>", "<cmd>TmuxNavigateLeft<cr>" },
            { "<A-j>", "<cmd>TmuxNavigateDown<cr>" },
            { "<A-k>", "<cmd>TmuxNavigateUp<cr>" },
            { "<A-l>", "<cmd>TmuxNavigateRight<cr>" },
            { "<A-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
        },
    },
}
