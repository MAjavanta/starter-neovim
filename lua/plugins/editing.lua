return {
    -- PLUGIN: nvim-autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",  -- load only when entering insert mode (saves startup time)
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        config = function()
            local autopairs = require("nvim-autopairs")

            autopairs.setup({
                check_ts = true,  -- Enable treesitter integration for context-aware pairing
                ts_config = {
                    lua = { "string" },          -- disable autopairs in lua strings
                    javascript = { "template_string" },  -- for js template strings
                    html = true,                 -- enable in html files
                },
                fast_wrap = {},  -- optional: can configure fast wrap keys here
            })

            -- Integration with nvim-cmp completion to auto-close pairs after completion confirm
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")

            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    -- PLUGIN: nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",     -- LSP completions
            "hrsh7th/cmp-buffer",       -- Buffer words completions
            "hrsh7th/cmp-path",         -- File path completions
            "hrsh7th/cmp-cmdline",      -- Command line completions
            "L3MON4D3/LuaSnip",         -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- Snipper completions for LuaSnip
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                -- Key mappings for insert mode completions
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(),     -- Next item in completion menu
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),   -- Previous item
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),        -- Scroll docs up
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),         -- Scroll docs down
                    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm completion, but don't auto-select first item
                    ["<C-Space>"] = cmp.mapping.complete(),       -- Manually trigger completion menu
                }),
                -- Sources to get completions from
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },  -- From LSP servers
                    { name = "luasnip" },   -- Snippets
                },
                {
                    { name = "buffer" },    -- Buffer words fallback
                    { name = "path" },
                }),
                
            })
            
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "cmp_git" }, -- git-specific completions
                }, {
                    { name = "buffer" },  -- fallback to buffer words
                }),
            })

            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                },
                {
                    { name = "cmdline" },
                }),
            })
        end
    },
    -- PLUGIN: Comment.nvim
    {
        "numToStr/Comment.nvim",
        event = "BufReadPre",
        config = function()
            require("Comment").setup()

            vim.keymap.set('n', '<C-_>', '<Plug>(comment_toggle_linewise_current)', { noremap = true, desc = "Toggle line comment (normal mode)" })
            vim.keymap.set('v', '<C-_>', '<Plug>(comment_toggle_linewise_visual)', { noremap = true, desc = "Toggle line comment (visual mode)" })
            vim.keymap.set('n', '<C-b>', '<Plug>(comment_toggle_blockwise_current)', { noremap = true, desc = "Toggle block comment (normal mode)" })
            vim.keymap.set('v', '<C-b>', '<Plug>(comment_toggle_blockwise_visual)', { noremap = true, desc = "Toggle block comment (visual mode)" })
        end,
    },
    -- PLUGIN: vim-illuminate
    {
        'RRethy/vim-illuminate',
        lazy = false,
        config = function()
            require("illuminate").configure({
                delay = 200,
                providers = {
                    "lsp",
                    "treesitter",
                    "regex",
                },
                under_cursor = true,
            })
        end
    },
    -- PLUGIN: nvim-surround
    {
	    "kylechui/nvim-surround",
	    version = "*",
	    event = "VeryLazy",
	    config = function()
		    require("nvim-surround").setup()
	    end,
    }
}
