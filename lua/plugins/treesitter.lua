return {
    -- PLUGIN: nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- Make sure parsers stay updated
        event = { "BufReadPost", "BufNewFile" }, -- Lazy load when opening file
        config = function()
            require("nvim-treesitter.configs").setup({

                -- Languages to install automatically for parsing
                ensure_installed = {
                    "markdown",  "markdown_inline", "python", "lua", "gitignore", "dockerfile",
                    "json", "yaml", "javascript", "typescript", "tsx", "html", "css",
                    "c", "cpp", "bash"
                },

                -- Install missing parsers automatically
                auto_install = true,

                -- Syntax highlighting
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },

                -- Indentation
                indent = {
                    enable = true,
                },

                -- Incremental selection to expand/shrink code selection based on code semantics
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-Space>",
                        node_incremental = "<C-Space>",
                        scope_incremental = "<C-e>",
                        node_decremental = "<C-s>",
                    },
                },
            })
        end,
    },
    -- PLUGIN: nvim-ts-autotag
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,            -- auto close tags
                    enable_rename = true,           -- auto rename paired tags
                    enable_close_on_slash = false,  -- don't close on </
                },
                per_filetype = {
                    ["html"] = { enable_close = true },
                },
            })
        end,
    },
}
