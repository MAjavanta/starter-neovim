return {
    "williamboman/mason.nvim",
    lazy = false, -- load immediately, since LSP setup depends on it
    cmd = "Mason", -- optional: you can trigger Mason UI manually
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                },
                border = "rounded", -- nice rounded UI border
                width = 0.8,        -- make the Mason window a bit larger
                height = 0.8
            }
        })
    end
}
