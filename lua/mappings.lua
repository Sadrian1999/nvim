require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Molten init", silent = true })
map("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { desc = "Molten evaluate line", silent = true })
map(
    "v",
    "<leader>mv",
    ":<C-u>MoltenEvaluateVisual<CR>",
    { desc = "Molten evaluate visual", silent = true }
)
map(
    "n",
    "<leader>mc",
    ":MoltenReevaluateCell<CR>",
    { desc = "Molten reevaluate cell", silent = true }
)
