-- Initial setup
local keymap = vim.keymap
-- stops recursive remapping and doesn't show the command in the command bar when run
local opts = { noremap = true, silent = true }

-- Common
keymap.set("n", "<leader>w", ":w<CR>", opts) -- Save
keymap.set("n", "<leader>q", ":q<CR>", opts) -- Quit
keymap.set("n", "<leader>h", ":nohlsearch<CR>", opts) -- Clear highlights

-- Navigating panes
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Pane splitting
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)

-- Escape mapping 
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Indenting
-- (allows indenting in visual mode without deselecting visual mode)
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Moving lines
keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", { desc = "moves line down in visual selection" })
keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv", { desc = "moves line up in visual selection" })

-- Copy whole file
keymap.set("n", "<leader>ya", "gg0yG")

-- Delete without overwriting clipboard
keymap.set({ "n", "v" }, "<leader>d", [["_dP]])

-- Search and replace
-- (global for word under cursor)
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
