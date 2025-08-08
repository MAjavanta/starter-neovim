-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Lazy setup options
local lazy_opts = {
  defaults = {
    -- make plugins lazy by default for faster startup
    -- some plugins will be explicitly set to not load lazily
    lazy = true,
  },

  -- When first installing, make sure at least this colorscheme is available
  install = {
    colorscheme = { "rose-pine", "tokyonight"}, -- fallback list
  },

  -- Disable builtin runtime plugins you don't use
  rtp = {
    disabled_plugins = {
      "gzip",
      "matchit",
      "matchparen",
      "netrw",
      "netrwPlugin",
      "tarPlugin",
      "tohtml",
      "tutor",
      "zipPlugin",
    },
  },

  -- Show a notification if plugin spec files change while you're editing them
  change_detection = {
    notify = true,
  },

  -- UI tweaks (border/icons)
  ui = {
  border = "rounded",
  },

}

require("lazy").setup("plugins", lazy_opts)
