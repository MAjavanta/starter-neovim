return {
    -- Main Telescope plugin
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
        },
        keys = {
            { "<leader>sf", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
            { "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
            { "<leader>sb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
            { "<leader>sk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
        },
        config = function()
            local telescope = require("telescope")

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = { "truncate" },

                    -- Force horizontal layout by default
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            preview_width = 0.5, -- fraction of the picker width for preview
                        },
                        -- overall size of the picker window
                        width = 0.85,
                        height = 0.80,
                        -- If editor width is less than this, Telescope may hide/move preview
                        -- Make it small so preview stays visible even with sidebars open
                        preview_cutoff = 40,
                    },

                    mappings = {
                        i = {
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                            ["<C-h>"] = "which_key",
                        },
                    },

                    -- Use ripgrep and include hidden files but ignore .git
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                        "--glob",
                        "!.git/*",
                    },
                },

                pickers = {
                    -- Remove theme = "dropdown" so the global horizontal layout applies
                    find_files = {
                        previewer = true, -- show right-hand preview
                        hidden = true,    -- show dotfiles
                    },
                    live_grep = {
                        previewer = true, -- show right-hand preview
                    },
                    buffers = {
                        sort_lastused = true,
                    },
                    git_files = {
                        previewer = true,
                    },
                },
            })

            -- Load fzf extension if installed
            pcall(telescope.load_extension, "fzf")
        end,
    },
}
