-- HACK: mason-lspconfig v2 breaking changes, so until a PR on LazyVim is merged include `branch...` to workaround mason-lspconfig v2 changes (uses native lsp rather than being tied to mason)
-- see Issue: https://github.com/LazyVim/LazyVim/issues/6039 and PR: https://github.com/LazyVim/LazyVim/pull/6041,
return {
    { "mason-org/mason.nvim", version = "^1.0.0" },
    { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
}
