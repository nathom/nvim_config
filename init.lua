--[[
 _ __   __ _| |_| |__   ___  _ __ ___
| '_ \ / _` | __| '_ \ / _ \| '_ ` _ \
| | | | (_| | |_| | | | (_) | | | | | |
|_| |_|\__,_|\__|_| |_|\___/|_| |_| |_|

Welcome to my neovim config!
]]

--[[
├── init.lua                 // All of my options and keymaps
└── lua
    ├── autocommands.lua     // A lua api for vim autocommands
    ├── config               // Plugin specific config files
    │    ...                 // The ones worth checking out are shown
    │   ├── buftabline.lua
    │    ...
    │   ├── feline.lua
    │    ...
    │   ├── lsp.lua
    │    ...
    │   └── utils.lua        // Common utility functions
    ├── packer_compiled.lua
    └── plugins.lua          // An annotated list of my plugins
]]

-- CREDIT: Heavily inspired by https://github.com/wbthomason/dotfiles

-- require("lazy").setup(plugins, opts)

local fn = vim.fn
local cmd = vim.cmd
local start = os.clock()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Improve startup time
-- require("impatient")

--[[
Splitting my init.lua config into multiple files allows
impatient.nvim to compile and cache them, resulting in
a significant startup time improvement.
]]

-- All of my plugins
require("opts")
require("lazy").setup("plugins")
-- require("plugins")

-- All of my options

-- All of my key mappings
require("mappings")

-- All of my autocommands
require("autocommands")

-- The greatest colorscheme!
cmd("colorscheme gruvbox")

-- require("autocommands")

-- Cache the humungous packer_compiled.lua file with impatient.nvim
-- for a solid speedup
-- require("packer_compiled")
