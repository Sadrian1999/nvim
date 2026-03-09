local nvlsp = require("nvchad.configs.lspconfig")
local on_attach, on_init, capabilities = nvlsp.on_attach, nvlsp.on_init, nvlsp.capabilities

local function setup(server, opts)
    opts = opts or {}
    opts.on_attach = opts.on_attach or on_attach
    opts.on_init = opts.on_init or on_init
    opts.capabilities = opts.capabilities or capabilities

    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
end

setup("pyright")

setup("clangd", {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
})

setup("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { enable = false },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
