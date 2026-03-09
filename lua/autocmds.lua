require("nvchad.autocmds")
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.g.loaded_python3_provider = nil
        vim.g.python3_host_prog = "/Users/adriansvanyova/anaconda3/envs/uni/bin/python"
        vim.cmd("silent! runtime plugin/provider.vim")
        vim.cmd("silent! runtime plugin/rplugin.vim")
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.ipynb",
    callback = function()
        local ok, jupytext = pcall(require, "jupytext")
        if ok then
            jupytext.sync()
            vim.bo.filetype = "python"
        end
    end,
})
