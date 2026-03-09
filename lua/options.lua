require("nvchad.options")

local o = vim.o
vim.g.python3_host_prog = vim.fn.expand("~/anaconda3/envs/uni/bin/python")
-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

vim.g.magma_automatically_open_output = false
vim.g.magma_open_output = 0
