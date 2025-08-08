return {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- load before files are opened
    dependencies = { "williamboman/mason.nvim" },
    opts = {
        ensure_installed = {
            -- Python
            "basedpyright",
            "ruff",

            -- JS/TS/React
            "ts_ls",
            "eslint",

            -- Vue
            "vue_ls",

            -- HTML/CSS
            "html",
            "cssls",
            "tailwindcss",

            -- Lua
            "lua_ls",

            -- C/C++
            "clangd",

            -- General
            "jsonls",
            "yamlls",
            "marksman",

        },
        automatic_installation = true, -- auto-install configured servers
    }
}
