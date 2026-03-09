local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = { "pyright", "clangd", "lua_ls" },
    automatic_installation = false,
})
