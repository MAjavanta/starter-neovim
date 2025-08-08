return {
    -- PLUGIN: nvim-tree.lua
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        keys = {
            { "<leader>t", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
        },
        config = function()
            -- Transparent background for the tree window
            vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

            -- Setup nvim-tree with minimal config
            require("nvim-tree").setup({
                filters = {
                    dotfiles = false,  -- Show dotfiles
                },
                view = {
                    width = 30,
                    side = "left",
                },
                actions = {
                    open_file = {
                        quit_on_open = true,  -- Keep tree open after opening a file
                    },
                },
            })
        end,
    },
    -- PLUGIN: transparent.nvim
    {
        'tribela/transparent.nvim',
        event = 'VimEnter',
        config = function()
            require("transparent").setup({
                extra_groups = {
                    "NvimTreeNormal",
                    "NvimTreeEndOfBuffer",
                    "TelescopeNormal",
                    "TelescopePromptNormal",
                    "TelescopePromptBorder",
                    "TelescopeResultsNormal",
                    "TelescopeResultsBorder",
                },
            })
            vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
                callback = function()
                    vim.cmd("TransparentEnable")
                end,
            })

            vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
                pattern = "*",
                callback = function()
                    local ft = vim.bo.filetype
                    if ft == "NvimTree" or ft == "TelescopePrompt" or ft == "TelescopeResults" or ft == "TelescopePreview" then
                        vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
                        vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
                    else
                        vim.cmd("TransparentEnable")
                    end
                end,
            })

            vim.keymap.set('n', '<leader>ee', ':TransparentToggle<CR>', { desc = 'Toggle transparent background' })
        end,
    },
    -- PLUGIN: nvim-web-devicons
    {
        "nvim-tree/nvim-web-devicons"
    },
    -- PLUGIN: indent-blankline
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = false,
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
	    config = function()
	    	require("ibl").setup()
	    end
    },
    -- PLUGIN: lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local theme = require('lualine.themes.rose-pine')
            theme.normal.c.bg = nil
            require('lualine').setup({
                options = {
                globalstatus = true,
                theme = theme,
            },
            sections = {
                lualine_a = { 'buffers' },
            },
            })
        end,
    },
    -- PLUGIN: gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add          = { text = "" },
                    change       = { text = "󰥛" },
                    delete       = { text = "" },
                    topdelete    = { text = "" },
                    changedelete = { text = "" },
                },
                current_line_blame = true, -- inline blame text
            })
        end,
    },
    -- PLUGIN: which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.setup()
            wk.add({
                { "<leader>g", group = "git" },
                { "<leader>f", group = "file" },
                { "<leader>l", group = "lsp" },
            })
        end,
    }
}
