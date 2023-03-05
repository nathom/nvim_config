return {
	--- *** BEGIN ESSENTIALS *** ---

	-- A faster port of the legendary gruvbox colorscheme
	-- use("lifepillar/vim-gruvbox8")

	-- Treesitter highlights
	-- Much more comprehensive and accurate than regex highlighting
	-- There may be performance issues on older laptops and with large
	-- source files
	-- A tabline that shows the current buffers
	-- TODO:

	-- Gutter signs that show changes to the current file
	-- Also provides an api that is used by my statusline

	-- Markdown utilities
	-- The ultimate markdown plugin
	-- 	{
	-- 		"plasticboy/vim-markdown",
	-- 		init = [[require('config.vim_markdown')]],
	-- 		dependencies = { "godlygeek/tabular" },
	-- 		ft = "markdown",
	-- 	}
	-- )

	--- *** END ESSENTIALS *** ---

	--- *** BEGIN NICE-TO-HAVES *** ---

	-- Defines two mappings that make simple find and replace easier
	-- { dir = "nathom/easy-replace.nvim" },

	-- A *much* faster replacement for the filetype.vim runtime file
	-- Github Version:
	-- { "nathom/filetype.nvim"},
	-- As of 2/21/22, it is faster than the new filetype.lua file

	-- A faster python indent config
	-- Github Version:
	-- { "nathom/fast-python-indent"},

	--- *** END NICE-TO-HAVES *** ---

	--- *** BEGIN EXPERIMENTAL *** ---

	-- Speeds up startup
	-- "lewis6991/impatient.nvim",

	-- Only compute folds on write
	-- {
	-- 	"Konfekt/FastFold",
	-- 	init = [[require("config.fastfold_setup")]],
	-- 	-- config = [[require("config.fastfold")]],
	-- 	-- keys = { { "n", "z" } },
	-- },
}
