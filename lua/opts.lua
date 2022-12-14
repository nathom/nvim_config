local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require("config.utils")
local opt = utils.opt

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
	"gzip",
	"man",
	"matchit",
	"matchparen",
	"shada_plugin",
	"tarPlugin",
	"tar",
	"zipPlugin",
	"zip",
	"netrwPlugin",
	"2html_plugin",
	"remote_plugins",
}

for _, plugin in ipairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

-- Skip some remote provider loading
g.loaded_python_provider = 0
g.python_host_prog = "/usr/bin/python2"
g.python3_host_prog = utils.HOME .. "/.pyenv/shims/python"
g.node_host_prog = "/usr/bin/neovim-node-host"

g.netrw_browsex_viewer = "open"

-- For testing out the new filetype.lua
-- Still slower than filetype.nvim, probably because it doesn't lazy load
-- g.do_filetype_lua = 1
-- g.did_load_filetypes = 0

-- Custom options
-- opt(x, y) is equivalent to :set x=y
opt("termguicolors", true)
opt("background", "dark")
opt("showcmd", false)

-- Dont show "-- INSERT --" etc in command bar since it is on the statusline
opt("showmode", false)

-- Nice for jumping around
opt("number", true)
opt("relativenumber", true)

-- Tab settings
opt("expandtab", true)
opt("smarttab", true)
opt("tabstop", 4)
-- Set by sleuth.vim
opt("shiftwidth", 4)

-- Enable mouse scrolling/highlighting
opt("mouse", "a")

opt("autoread", true)
opt("encoding", "UTF-8")
opt("hidden", true)
opt("cursorline", true)

-- Global statusline at the bottom
-- Much cleaner with splits
-- Needs nvim 0.7
opt("laststatus", 3)

-- No sounds please
opt("errorbells", false)
opt("visualbell", false)

-- More intuitive split presets
opt("splitbelow", true)
opt("splitright", true)

-- Speed related optimizations
opt("tm", 500)
opt("lazyredraw", true)

-- Use git!
opt("backup", false)
opt("writebackup", false)
-- This is slow, and barely useful
opt("swapfile", false)

-- Searching presets
opt("ignorecase", true)
opt("smartcase", true)
opt("hlsearch", true)
opt("incsearch", true)

-- The shell with the fastest startup time
opt("shell", "/bin/bash")
-- Faster searching with ripgrep
opt("grepprg", "rg --vimgrep --no-heading --smart-case")

-- Extremely useful
opt("undofile", true)
opt("undodir", utils.HOME .. "/.nvim_undo")

-- Speed up startup time
-- Doesn't work with vim.opt for some reason
vim.cmd([[set shada="NONE"]])

-- Fast, and works well enough with most file types
-- opt("foldmethod", "indent")
-- opt("foldmethod", "expr")
-- opt("foldexpr", "nvim_treesitter#foldexpr()")
-- Makes folding less annoying
-- opt("foldnestmax", 2)
-- Open folds by default
-- opt("foldlevel", 99)

opt("completeopt", "menuone,noselect")
opt("scrolloff", 2)
