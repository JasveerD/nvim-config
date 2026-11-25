local map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- File explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", "Toggle file explorer")
map("n", "<leader>E", ":NvimTreeFocus<CR>",  "Focus file explorer")

-- Telescope
local tb = require("telescope.builtin")
map("n", "<C-p>",      tb.find_files,                "Find files")
map("n", "<leader>ff", tb.find_files,                "Find files")
map("n", "<leader>fg", tb.live_grep,                 "Live grep")
map("n", "<leader>fb", tb.buffers,                   "Find buffers")
map("n", "<leader>fh", tb.help_tags,                 "Help tags")
map("n", "<leader>fr", tb.oldfiles,                  "Recent files")
map("n", "<leader>fc", tb.commands,                  "Commands")
map("n", "<leader>fd", tb.diagnostics,               "Diagnostics")
map("n", "<leader>/",  tb.current_buffer_fuzzy_find, "Fuzzy search buffer")

-- Buffer navigation
map("n", "<S-h>",      ":bprevious<CR>", "Prev buffer")
map("n", "<S-l>",      ":bnext<CR>",     "Next buffer")
map("n", "<leader>bd", ":bd<CR>",        "Delete buffer")

-- Window navigation
map("n", "<C-h>", "<C-w>h", "Move to left window")
map("n", "<C-l>", "<C-w>l", "Move to right window")
map("n", "<C-j>", "<C-w>j", "Move to lower window")
map("n", "<C-k>", "<C-w>k", "Move to upper window")

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", "Move line down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move line up")

-- Keep cursor centred when jumping
map("n", "<C-d>", "<C-d>zz", "Scroll down (centred)")
map("n", "<C-u>", "<C-u>zz", "Scroll up (centred)")
map("n", "n",     "nzzzv",   "Next search (centred)")
map("n", "N",     "Nzzzv",   "Prev search (centred)")

-- Clear search highlight
map("n", "<Esc>", ":nohlsearch<CR>", "Clear search highlight")

-- Quick save / quit
map("n", "<leader>w", ":w<CR>", "Save file")
map("n", "<leader>q", ":q<CR>", "Quit")

-- Create global .clang-format
map("n", "<leader>cf", function()
	local config = [[BasedOnStyle: LLVM
IndentWidth: 4
UseTab: Always
TabWidth: 4
]]
	local path = vim.fn.expand("~/.clang-format")
	local f = io.open(path, "w")
	if f then
		f:write(config)
		f:close()
		vim.notify("Created ~/.clang-format", vim.log.levels.INFO)
	else
		vim.notify("Failed to create ~/.clang-format", vim.log.levels.ERROR)
	end
end, "Create global .clang-format")
