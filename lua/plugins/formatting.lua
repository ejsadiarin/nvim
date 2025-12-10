return {
  -- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile", "InsertLeave" },
    opts = {
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" }, -- 2 spaces instead of tab
        },
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" }, -- 4 spaces instead of tab
        },
        yamlfmt = {
          prepend_args = {
            "-formatter",
            "indent=2,include_document_start=true,retain_line_breaks_single=true,line_ending=lf,sequence_style=block,mapping-style=block",
          },
        },
      },
      -- format_on_save = function()
      --     -- Disable with a global variable
      --     if not vim.g.autoformat then
      --         return
      --     end
      --     return { async = false, timeout_ms = 500, lsp_fallback = false }
      -- end,
      -- log_level = vim.log.levels.TRACE,
      formatters_by_ft = {
        go = { "gofumpt", "goimports" },
        javascript = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
        python = { "isort", "ruff_format" },
        sh = { "shfmt" },
        terraform = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
        tex = { "latexindent" },
        toml = { "taplo" },
        typst = { "typstfmt" },
        yaml = { "yamlfmt" },
      },
    },
  },
}
