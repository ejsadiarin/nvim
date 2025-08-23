-- require("lspconfig").jdtls.setup({
--     handlers = {
--         -- By assigning an empty function, you can remove the notifications
--         -- printed to the cmd
--         ["$/progress"] = function(_, result, ctx) end,
--     },
-- })
return {
    {
        "nvim-java/nvim-java",
        ft = { "java", "kt", "kotlin" },
        -- opts = {
        --     jdk = {
        --         auto_install = false,
        --     },
        -- },
    },
}
