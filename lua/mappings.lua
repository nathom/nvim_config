local utils = require("config.utils")
local map = utils.map
local g = vim.g

local silent = { silent = true }

-- Leader/local leader
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

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

-- System clipboard copy/paste (macOS)
map({ "n", "v" }, "<leader>y", [["*y]], silent)
map({ "n", "v" }, "<leader>Y", [["*y$]], silent)
map({ "n", "v" }, "<leader>p", [["*p]], silent)

-- Show LSP error messages
map("n", "<leader>t", "<cmd>TroubleToggle<cr>", silent)

-- Toggle folds
-- REMOVED, replaced by discovery of zR and zM
-- map("n", "<leader>f", [[ <cmd>if &foldlevel == 0 | set foldlevel=99 | else | set foldlevel=0 | endif<cr> ]], silent)

-- Move entire lines up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Open main org file
map(
	"n",
	"<leader>of",
	"<cmd>e "
		.. utils.HOME
		.. "/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents"
		.. "/org/inbox.org<cr>"
)

-- Open file using system application
map("n", "<leader>op", [[<cmd>call system("open '" . expand('%:p') . "'")<cr>]])

-- Focus mode
map("n", "<leader>z", [[<cmd>TZAtaraxis<cr>]])

local replace_termcodes = vim.api.nvim_replace_termcodes
local TAB = replace_termcodes("<Tab>", true, false, true)
local CTRL_N = replace_termcodes("<C-N>", true, false, true)
local ESC = replace_termcodes("<Esc>", true, false, true)

function ft_tab_action(line, col)
	-- Filetype specific actions for <Tab>

	-- Markdown:
	-- Pressing tab on a line with an empty bullet point indents the line
	local fn = vim.api.nvim_buf_get_name(0)
	local ext = fn:match(".*%.(%w+)")
	if ext == "md" then
		local _, i = line:find("^%s*-")
		if i == nil then
			return
		end
		if col - i <= 2 then
			return ESC .. ">>A"
		end
	end
end

function tabcomplete()
	-- If the line is empty or the cursor is at the start of the line
	-- send TAB
	-- Otherwise, use C-N autocomplete
	local line = vim.fn.getline(".")
	local col = vim.fn.col(".")
	local keys = ft_tab_action(line, col)
	if keys ~= nil then
		vim.api.nvim_feedkeys(keys, "n", true)
		return
	elseif col == 1 or line:match("^%s*$") then
		vim.api.nvim_feedkeys(TAB, "n", true)
	else
		vim.api.nvim_feedkeys(CTRL_N, "n", true)
	end
end

map("i", "<tab>", "<cmd>lua tabcomplete()<cr>")

function smart_dd()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end

map("n", "dd", smart_dd, { noremap = true, expr = true })

map({ "x", "v" }, "<leader>a", ":Tabularize /")
