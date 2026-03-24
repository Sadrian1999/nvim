local options = {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "fish",
        "lua",
        "luadoc",
        "markdown",
        "printf",
        "python",
        "toml",
        "vim",
        "vimdoc",
        "yaml",

        "javascript",
        "typescript",
        "html",
        "css",
        "scss",
        "angular",
    },

    highlight = {
        enable = true,
    },

    indent = {
        enable = true,
        disable = { "python", "html" },
    },
}

require("nvim-treesitter.configs").setup(options)
