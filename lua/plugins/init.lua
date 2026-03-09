return {
    {
        "GCBallesteros/jupytext.nvim",
        lazy = false,
        config = function()
            require("jupytext").setup({
                style = "percent",
                output_extension = "py",
                force_ft = "python",
            })
        end,
    },
    {
        "dccsillag/magma-nvim",
        build = ":UpdateRemotePlugins",
        lazy = false,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require("nvim-tree").setup({
                filters = {
                    dotfiles = false,
                    custom = { "__init__.py" }, -- ⬅️ ez tiltja
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },

    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("configs.conform")
        end,
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { "tpope/vim-dadbod", lazy = true },
            {
                "kristijanhusak/vim-dadbod-completion",
                ft = { "sql", "mysql", "plsql" },
                lazy = true,
            },
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        init = function()
            local homedir = os.getenv("HOME")
            local student = homedir .. "/Dev/pdf/backend/app/data/app.db"

            vim.g.dbs = {
                -- alias = "<dialect>:///<absolute-path>"
                student = "sqlite3:///" .. student,
            }
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    { -- optional saghen/blink.cmp completion source
        "saghen/blink.cmp",
        opts = {
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                per_filetype = {
                    sql = { "snippets", "dadbod", "buffer" },
                },
                -- add vim-dadbod-completion to your completion providers
                providers = {
                    dadbod = {
                        name = "Dadbod",
                        module = "vim_dadbod_completion.blink",
                    },
                },
            },
        },
    },
    {
        "akinsho/flutter-tools.nvim",
        ft = { "dart" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            require("flutter-tools").setup({
                lsp = {
                    color = { enabled = true },
                },
                debugger = { enabled = true, run_via_dap = true },
                widget_guides = { enabled = true },
                closing_tags = { highlight = "Comment" },
            })
        end,
    },
}
