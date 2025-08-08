return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Common on_attach for all servers
        local on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            local keymap = vim.keymap.set

            -- LSP keymaps
            keymap('n', 'gd', vim.lsp.buf.definition, opts)
            keymap("n", "gr", vim.lsp.buf.references, opts)
            keymap("n", "gl", function()
                vim.diagnostic.open_float({})
            end, opts)
            keymap("n", "K", vim.lsp.buf.hover, opts)
            keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
            keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end

        -- Diagnostic signs
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                },
            },
        })

        -- Server configurations (new API)
        local lsp = vim.lsp

        -- Python: Ruff
        lsp.config("ruff", {
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                on_attach(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ async = false })
                    end,
                })
            end,
            filetypes = { "python" },
            init_options = {
                settings = {
                    lint = { enable = true },
                    format = { enable = true },
                },
            },
        })

        -- Python: BasedPyright
        lsp.config("basedpyright", {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "python" },
        })

        -- Lua
        lsp.config("lua_ls", {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "lua" },
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = { checkThirdParty = false },
                },
            },
        })

        -- JS/TS
        lsp.config("ts_ls", {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        })

        -- HTML
        lsp.config("html", {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html" }
        })

        -- CSS
        lsp.config("cssls", {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "css", "scss", "less" }
        })

        -- TailwindCSS
        lsp.config("tailwindcss", {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" }
        })

        -- Vue
        lsp.config("vue_ls", {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "vue" }
        })

        -- C/C++
        lsp.config("clangd", {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "c", "cpp", "objc", "objcpp" }
        })

        -- YAML
        lsp.config("yamlls", {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "yaml", "yml" }
        })

        -- JSON
        lsp.config("jsonls", {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "json", "jsonc" }
        })

        -- Markdown
        lsp.config("marksman", {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "markdown" }
        })

        -- Finally, let Mason handle enabling installed servers
        require("mason-lspconfig").setup({
            ensure_installed = {}, -- already in your mason-lspconfig.lua
            automatic_enable = true,
        })
    end,
}
