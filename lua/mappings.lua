local utils = require("utils")
local map = utils.map
local cmd = vim.cmd

local silent = { silent = true }

-- Fix commonly mistyped words
cmd("iabbrev teh the")
cmd("iabbrev hte the")
cmd("iabbrev fo of")
cmd("iabbrev ot to")

-- Force quit everything quickly
cmd("command! Q qa!")

-- From tpope/unimpaired.vim, not interested in the rest of
-- that plugin

-- Add spaces before/after line
map("n", "[<space>", "<cmd>put!=repeat(nr2char(10), v:count1)|silent ']+<cr>")
map("n", "]<space>", "<cmd>put =repeat(nr2char(10), v:count1)|silent '[-<cr>")

-- Navigate through buffers (nice with bufferline.nvim)
map("n", "[b", "<cmd>bp<cr>")
map("n", "]b", "<cmd>bn<cr>")

-- Complete curly brackets using K&R style
map("i", "<C-c>", "<Esc>A {<cr>}<Esc>O")

-- Force write `,w`
map("n", "<localleader>w", "<cmd>w!<cr>", silent)
-- Close buffer `,q`
map("n", "<localleader>q", "<cmd>Sayonara<cr>")

-- Show LSP error messages
map("n", "<leader>t", "<cmd>TroubleToggle<cr>", silent)

-- Move entire lines up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "L", vim.diagnostic.open_float)

-- Open file using system application
map("n", "<leader>op", [[<cmd>call system("open '" . expand('%:p') . "'")<cr>]])

vim.keymap.del({ "n" }, "<C-w>d")
vim.keymap.del({ "n" }, "<C-w><C-d>")

local function smart_dd()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end

map("n", "dd", smart_dd, { noremap = true, expr = true })

map({ "x", "v" }, "<leader>a", ":Tabularize /")
