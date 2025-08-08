# My Neovim Configuration

Beginner Neovim config for Python, C, C++, Lua, and web development (HTML, CSS, JS, TS, React, Vue)

This is designed to be a relatively lightweight Neovim configuration while still being beginner friendly and allowing you to get started quickly should you choose to use it.

If you don't already know this [Kickstart](https://github.com/nvim-lua/kickstart.nvim) is a great beginner Neovim config. However, I found it difficult to know exactly how to extend it to my liking, so I made this. This should be usable from the get-go but also provides a modular structure to follow.

---

## Overview

Below is a brief description of the workings of Neovim, which should help you understand the config better and then also help you if you choose to play around with it yourself.

### How Neovim Loads This Config

- Neovim starts by loading the `init.lua` file located in `~/.config/nvim/`.
- This `init.lua` acts as the entry point for all Neovim configs and uses Lua’s `require` to load modules.
- For example, when you see a line like `require("core.options")`, Neovim looks for a Lua file at `lua/core/options.lua` and loads its contents.
- This modular structure makes the config clean, organized, and easy to maintain.
> Note that some Neovim configurations only use a single `init.lua` file. This puts everything in the same place and is simple for beginners. Kickstart is such an example.

---

### Plugin Management with Lazy.nvim

- This config uses [Lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.
- Lazy.nvim loads plugins on demand to optimize startup time.
- Plugins are declared in the `lua/plugins/` directory, organized by categories like `ui`, `lsp`, `editing`, etc.
- Each plugin file returns a Lua table with plugin metadata and configuration.
- You can easily add, remove, or update plugins by editing these files.

To add a new plugin, you simply need to add a new Lua table to the `return` statement in a file that takes the format:
```
{
    "githubuser/githubrepo",
    lazy = false, -- OR define the event for lazy loading, such as BufReadPre (before reading a buffer) or InsertEnter (entering insert mode)
    config = function()
        require("githubrepo").setup()
    end,
}
```

You can explore a plugin's GitHub to see how you can configure or use it. Many have instructions on how to install using Lazy.

---

### Language Server Setup with Mason.nvim and nvim-lspconfig

- Language servers provide IDE-like features (autocomplete, diagnostics, formatting).
- [Mason.nvim](https://github.com/williamboman/mason.nvim) manages installing and updating these language servers, linters, and formatters.
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) bridges Mason with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), which configures how language servers attach to buffers.
- The config ensures that necessary servers (e.g., Pyright for Python, tsserver for JavaScript/TypeScript) are installed and correctly set up for completion, linting, and formatting.
- Formatting on save and custom keybindings are configured per language server in `lua/plugins/lsp/lspconfig.lua`.

---

## Installation instructions

I don't have proper installation instructions, but I can tell you that this config was created using Neovim v 0.11, so ensure you have that installed.

Additionally, this config will require you to have the following: npm, node, python, gcc, luarocks (you don't need this and can edit the config without it)

Once you have those on your system, simply clone down the repository into the appropriate folder. If you already have a configuration, I suggest backing it up somewhere (e.g. by moving the nvim directory to a different name).

### Windows

In Windows, open PowerShell and run `cd $env:LOCALAPPDATA` followed by `mkdir nvim` and `cd nvim`. Clone this repository there.

### Linux (or WSL)

In Linux systems, Neovim will look for configuration files at `~/.congig/nvim/`. You may have to create the `.config/` and `nvim/` directories using the `mkdir` command.

## How to Customize This Config

1. **Adding Plugins**  
   Edit or create files in `lua/plugins/` to add or configure plugins. Follow the existing structure and use Lazy.nvim options for lazy loading, dependencies, and keybindings.

2. **Changing Editor Settings**  
   Modify `lua/core/options.lua` to change Neovim’s behavior, appearance, and default options.

3. **Adjusting Language Servers**  
   Update `lua/plugins/lsp/mason-lspconfig.lua` to add/remove language servers for Mason to manage.  
   Customize their setup and keymaps in `lua/plugins/lsp/lspconfig.lua`.

4. **Keybindings and Autocommands**  
   These are usually found in dedicated files like `lua/core/keymaps.lua` or inside individual plugin configs.

5. **Exploring Lazy.nvim Features**  
   Lazy.nvim supports features like profiling startup time, customizing plugin loading conditions, and more. Check its [documentation](https://github.com/folke/lazy.nvim) for advanced usage.

6. **Keeping Config Updated**  
   Regularly update plugins with Lazy’s update commands and Mason’s `:Mason` UI to keep your environment fresh.

---

## Useful Commands

- `:Lazy` — Open Lazy.nvim plugin manager UI.  
- `:Mason` — Open Mason UI to manage language servers, linters, and formatters.  
- `:LspInfo` — Show attached language servers for the current buffer.

---

## Acknowledgments

This config is heavily inspired by many fun, cool configurations I have seen online, as well as Kickstart. I designed this to be a good beginner's intro to Neovim, especially for those who didn't know where to go next after Kickstart.

Clone it down, use it for your coding, and if something breaks, see if you can play around in the config to fix it! This is how you learn! I recommend when you go into it, you at least change *something* to be more preferable to you. Maybe find a new theme, or change some keymaps. Personalisation is the point of Neovim!

---

*Happy coding!* 🚀
