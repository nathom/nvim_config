-- Automatically install packer if its not there
local fn = vim.fn

local install_path = fn.stdpath("data")
    .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    vim.cmd("packadd packer.nvim")
end

-- improve startup time
require("impatient")
-- load plugins
require("plugins")

-- Don't hash more than we need to
local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require("config.utils")
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map

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

-- g.did_load_filetype = 1

-- Leader/local leader
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- Skip some remote provider loading
g.loaded_python_provider = 0
g.python_host_prog = "/usr/bin/python2"
g.python3_host_prog = "/Users/nathan/.pyenv/shims/python"
g.node_host_prog = "/usr/bin/neovim-node-host"

g.netrw_browsex_viewer = "open"

-- g.did_load_filetypes = 1

-- Options (set x=y)
opt("termguicolors", true)
opt("background", "dark")
opt("showcmd", false)
opt("showcmd", false)
opt("number", true)
opt("relativenumber", true)
opt("expandtab", true)
opt("smarttab", true)
opt("tabstop", 4)
-- Set by sleuth.vim
opt("shiftwidth", 4)
opt("mouse", "a")
opt("autoread", true)
opt("encoding", "UTF-8")
opt("hidden", true)
opt("cursorline", true)
opt("termguicolors", true)
-- Sounds
opt("errorbells", false)
opt("visualbell", false)
-- Splitting
opt("splitbelow", true)
opt("splitright", true)
-- Speed
opt("tm", 500)
opt("lazyredraw", true)
-- Backups
opt("backup", false)
opt("writebackup", false)
opt("swapfile", false)
-- Searching
opt("ignorecase", true)
opt("smartcase", true)
opt("hlsearch", true)
opt("incsearch", true)

-- opt("guifont", "FiraCode Nerd Font:15")
opt("shell", "/bin/bash")
opt("grepprg", "rg --vimgrep --no-heading --smart-case")

-- opt("undodir", os.getenv("HOME") .. "/.vim/undo")
opt("undofile", true)

-- Speed up startup time
-- Doesn't work with vim.opt for some reason
vim.cmd([[set shada="NONE"]])

-- opt("foldmethod", "expr")
-- opt("foldexpr", "nvim_treesitter#foldexpr()")

opt("foldmethod", "indent")
opt("foldnestmax", 2)
opt("foldlevel", 99)
opt("completeopt", "menuone,noselect")
opt("scrolloff", 2)

cmd("colorscheme gruvbox8")

local silent = { silent = true }

-- These just make sense
-- or maybe not
-- Bracket mappings

-- Stolen from tpope/unimpaired.vim

-- Add spaces before/after line
map("n", "[<space>", "<cmd>put!=repeat(nr2char(10), v:count1)|silent ']+<cr>")
map("n", "]<space>", "<cmd>put =repeat(nr2char(10), v:count1)|silent '[-<cr>")

-- Navigate through buffers (nice with bufferline)
map("n", "[b", "<cmd>bp<cr>")
map("n", "]b", "<cmd>bn<cr>")

-- Complete curly brackets using K&R style
map("i", "[c", "<Esc>A {<cr>}<Esc>O")

-- map({ "n", "v", "o", "x" }, "L", "$")

-- Add spaces before and after line

-- map("n", "[<space>", "maI<cr><Esc>`a<cmd>delm a<cr>")

-- map("n", "[<space>", "maO<Esc>0D`a<cmd>delm a<cr>")
-- map("n", "]<space>", "mao<Esc>0D`a<cmd>delm a<cr>")

-- Force write quickly
map("n", "<localleader>w", "<cmd>w!<cr>", silent)
map("n", "<localleader>q", "<cmd>Sayonara<cr>")

-- System clipboard copy/paste (macOS)
map({ "n", "v" }, "<leader>y", [["*y]], silent)
map({ "n", "v" }, "<leader>Y", [["*y$]], silent)
map({ "n", "v" }, "<leader>p", [["*p]], silent)

map("n", "<leader>t", "<cmd>TroubleToggle<cr>", silent)

-- Easier to type this in 60% keyboard
map("n", "'", "`")

-- Toggle folds
map(
    "n",
    "<leader>f",
    [[ <cmd>if &foldlevel == 0 | set foldlevel=99 | else | set foldlevel=0 | endif<cr> ]],
    silent
)

-- Don't really use the default features for these
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map(
    "n",
    "<leader>of",
    "<cmd>e /Users/nathan/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/inbox.org<cr>"
)

map(
    "n",
    "<leader>op",
    [[<cmd>call system("open '" . expand('%:p') . "'")<cr>]]
)

map("n", "<leader>z", [[<cmd>TZAtaraxis<cr>]])

map("n", "<leader>pi", "<cmd>PackerInstall<cr>")
map("n", "<leader>ps", "<cmd>PackerSync<cr>")
map("n", "<leader>pc", "<cmd>PackerClean<cr>")
-- abbreviations
vim.cmd([[iabbrev teh the | iabbrev hte the | iabbrev fo of | iabbrev ot to]])

vim.cmd("command! Q qa!")

-- require("autocommands")
-- For impatient.nvim
require("packer_compiled")
