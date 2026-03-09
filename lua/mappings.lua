require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<F5>", function()
    vim.cmd("w")

    local ft = vim.bo.filetype
    local file = vim.fn.expand("%")
    local root = vim.fn.getcwd()

    local function has(path)
        return vim.fn.filereadable(path) == 1
    end

    local cmd = nil

    if ft == "python" then
        local venv_python = root .. "/.venv/bin/python"

        if has(venv_python) then
            cmd = venv_python .. " " .. vim.fn.shellescape(file)
        else
            cmd = "python " .. vim.fn.shellescape(file)
        end
    elseif ft == "javascript" then
        cmd = "node " .. vim.fn.shellescape(file)
    elseif ft == "typescript" then
        cmd = "bun run " .. vim.fn.shellescape(file)
    elseif ft == "sh" then
        cmd = "bash " .. vim.fn.shellescape(file)
    elseif ft == "go" then
        cmd = "go run " .. vim.fn.shellescape(file)
    elseif ft == "c" then
        cmd = "gcc " .. vim.fn.shellescape(file) .. " -o /tmp/a.out && /tmp/a.out"
    elseif ft == "cpp" then
        cmd = "g++ " .. vim.fn.shellescape(file) .. " -std=c++20 -o /tmp/a.out && /tmp/a.out"
    elseif ft == "rust" then
        cmd = "cargo run"
    end

    if not cmd then
        vim.notify("No runner for filetype: " .. ft, vim.log.levels.WARN)
        return
    end

    vim.cmd("terminal " .. cmd)
end)
