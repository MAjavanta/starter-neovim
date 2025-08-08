-- Create a new augroup for our custom autocommands
local autocmd_group = vim.api.nvim_create_augroup("core_autocmds", { clear = true })

-- 1. Highlight text when yanking (copying)
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Briefly highlight yanked text",
    group = autocmd_group,
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- 2. Disable line numbers in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
    desc = "No line numbers in terminal",
    group = autocmd_group,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})

-- 3. Auto-reload files changed outside of Neovim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    desc = "Check for file changes on focus gain or buffer enter",
    group = autocmd_group,
    command = "checktime",
})

-- 4. Auto-reload Neovim config when saving Lua files in ~/.config/nvim
vim.api.nvim_create_autocmd("BufWritePost", {
    desc = "Reload Neovim config on save",
    group = autocmd_group,
    pattern = vim.fn.stdpath("config") .. "/**/*.lua",
    callback = function(args)
        dofile(args.file)
        vim.notify("Reloaded " .. args.file, vim.log.levels.INFO)
    end,
})


