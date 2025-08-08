return {
    -- PLUGIN: vim-fugitive
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
        keys = {
            -- Git status dashboard
            { "<leader>gs", "<cmd>Git status<CR>", desc = "Git status" },

            -- Git commit and push
            { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
            { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },

            -- Diffing
            { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff split" },
            { "<leader>gD", "<cmd>Gvdiffsplit<CR>", desc = "Git diff vertical split" },

            -- Git stage / unstage current file
            { "<leader>ga", "<cmd>Git add %<CR>", desc = "Git add current file" },
            { "<leader>gu", "<cmd>Git restore --staged %<CR>", desc = "Git unstage current file" },
        },
    },
    -- PLUGIN: todo-comments
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup({
                keywords = {
                    FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG" } },
                    TODO = { icon = " ", color = "info" },
                    HACK = { icon = " ", color = "warning" },
                    WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
                    PERF = { icon = " ", color = "hint", alt = { "OPTIMIZE" } },
                    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                },
            })
        end,
    },
}
