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

-- Automatically install packer.nvim

local fn = vim.fn
local cmd = vim.cmd
local start = os.clock()

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	cmd("packadd packer.nvim")
end

-- Improve startup time
require("impatient")

--[[
Splitting my init.lua config into multiple files allows
impatient.nvim to compile and cache them, resulting in
a significant startup time improvement.
]]

-- All of my plugins
require("plugins")

-- All of my options
require("opts")

-- All of my key mappings
require("mappings")

-- All of my autocommands
require("autocommands")

-- The greatest colorscheme!
cmd("colorscheme gruvbox8")

-- Fix commonly mistyped words
cmd("iabbrev teh the")
cmd("iabbrev hte the")
cmd("iabbrev fo of")
cmd("iabbrev ot to")

-- Force quit everything quickly
cmd("command! Q qa!")

-- require("autocommands")

-- Cache the humungous packer_compiled.lua file with impatient.nvim
-- for a solid speedup
require("packer_compiled")
