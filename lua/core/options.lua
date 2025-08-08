-- Global options (set leader key to space bar)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic options

local opt = vim.opt

-- Allows full 24-bit colour in the terminal
opt.termguicolors = true

-- Line numbers
opt.number = true               -- show line number for current line
opt.relativenumber = true       -- and relative line number for all the other lines

-- Indenting behaviour, I like 4 spaces
opt.tabstop = 4                 -- number of visual spaces per TAB
opt.shiftwidth = 4              -- spaces used for auto-indenting
opt.softtabstop = 4             -- spaces inserted when pressing TAB
opt.expandtab = true            -- convert TAB presses to spaces
opt.smartindent = true          -- auto-indent new lines

-- UI behavious
opt.confirm = true              -- asks to save before quitting unsaved buffer
opt.wrap = false                -- don't wrap text for long lines
opt.signcolumn = "yes"          -- keeps column to the left of line numbers to prevent shifting
opt.cursorline = true           -- highlight cursor line for easier tracking
opt.scrolloff = 7               -- keep 7 lines between cursor and edge of screeen
opt.colorcolumn = "100"         -- colour column at 100 characters to know when your line is too long
opt.mouse = "a"                 -- enable mouse support in all modes
opt.clipboard = "unnamedplus"   -- use system clipboard
opt.undofile = true             -- persistent undo history
opt.encoding = "UTF-8"          -- set file encoding to UTF-8

-- Search options
opt.incsearch = true            -- show matches while searching
opt.ignorecase = true           -- ignore case while searching...
opt.smartcase = true            -- ...unless search contains uppercase characters

-- Splitting behaviour
opt.splitright = true           -- vertical splits open to the right
opt.splitbelow = true           -- horizontal splits open to the bottom

-- Folding behaviour (using Treesitter for code-aware folding)
opt.foldmethod = "expr"         -- use an expression to define folds
opt.foldexpr = "nvim_treesitter#foldexpr()" -- expression from treesitter to define folds
opt.foldcolumn = "1"            -- show a column on the left for fold markers
opt.foldlevelstart = 99         -- start with all folds expanded

-- Misc
opt.errorbells = false          -- disable annoying error sounds
opt.hidden = true               -- allow switching buffers without saving

