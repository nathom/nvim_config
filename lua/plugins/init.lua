return {
	--- *** BEGIN ESSENTIALS *** ---

	-- A faster port of the legendary gruvbox colorscheme
	-- use("lifepillar/vim-gruvbox8")
	{ "ellisonleao/gruvbox.nvim", priority = 100 },

	-- Treesitter highlights
	-- Much more comprehensive and accurate than regex highlighting
	-- There may be performance issues on older laptops and with large
	-- source files
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		-- dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		-- commit = "a62971e0efcbe025693ccfaf688b62d185fd50da",
		config = function(plugin)
			require("config.treesitter")
		end,
	},

	-- A tabline that shows the current buffers
	{
		"jose-elias-alvarez/buftabline.nvim",
		event = "BufAdd",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function(plugin)
			require("config.buftabline")
		end,
	},

	-- Fuzzy finding and live grep
	-- This is slower than FZF.vim, but is much more
	-- extensible and ergonomic to use
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			-- "telescope-frecency.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		init = function(plugin)
			require("config.telescope_setup")
		end,
		config = function(plugin)
			require("config.telescope")
		end,
		cmd = "Telescope",
		module = "telescope",
	},
	-- Improve the fuzzy finding speed a bit
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- Fast statusline
	-- Doesn't erase the startup screen like lualine does
	{
		"famiu/feline.nvim",
		config = function(plugin)
			require("config.feline")
		end,
		dependencies = { "itchyny/vim-gitbranch" },
		disable = false,
	},

	-- Gutter signs that show changes to the current file
	-- Also provides an api that is used by my statusline
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function(plugin)
			require("config.gitsigns")
		end,
		enable = false,
	},

	-- Easier configuration for LSP clients
	{
		"neovim/nvim-lspconfig",
		config = function(plugin)
			require("config.lsp")
		end,
		-- Lazy load this because it is *slow*
		-- An annoying thing with this setup is that
		-- you need to add filetypes to this array when you
		-- add a new LS.
		ft = { "c", "cpp", "rust", "go", "python", "javascript" },
	},
	-- Instead of cluttering up the screen with error messages,
	-- show them in a pretty window when requested
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		config = function(plugin)
			require("config.trouble")
		end,
	},

	-- Clears clutter from the screen for a more peaceful Neovim
	-- Less glitchy than Goyo.vim, especially with the bufferline
	{
		"Pocco81/TrueZen.nvim",
		config = function(plugin)
			require("config.truezen")
		end,
		cmd = "TZAtaraxis",
	},

	-- Automatically set tab settings based on the contents of the file
	"tpope/vim-sleuth",

	-- A fancy commenting plugin. You should read the docs to see all
	-- of its features
	{
		"numToStr/Comment.nvim",
		config = function(plugin)
			require("config.comment")
		end,
	},

	-- Text editing
	-- Creates new text objects, such as `ia`, which will select
	-- inside an argument in a function call
	{
		"wellle/targets.vim",
		keys = {
			{ "o", "i" },
			{ "o", "a" },
			{ "o", "I" },
			{ "o", "A" },
		},
	},
	-- Redefines the `w` object to make underscores and capital
	-- letters delimiters
	{
		"chaoren/vim-wordmotion",
		keys = {
			{ "n", "w" },
			{ "n", "b" },
			{ "n", "W" },
			{ "n", "B" },
			{ "o", "w" },
			{ "o", "W" },
		},
	},
	-- Easily surround text in characters
	{
		"tpope/vim-surround",
	},
	-- Complete pair-type characters
	{
		"windwp/nvim-autopairs",
		config = function(plugin)
			require("config.autopairs")
		end,
		event = "InsertEnter",
	},

	-- Stop highlighting after searching for text
	{
		"romainl/vim-cool",
		keys = { { "n", "/" }, { "n", "?" }, { "n", "*" }, { "n", "#" } },
	},

	-- Fast replacement for NETRW
	{ "justinmk/vim-dirvish", keys = { { "n", "-" } } },

	-- Change cwd to the project root
	-- Useful for fuzzy file finding
	{
		"airblade/vim-rooter",
		config = function(plugin)
			require("config.rooter")
		end,
	},

	-- Org-mode for neovim
	{
		-- "~/orgmode",
		"kristijanhusak/orgmode.nvim",
		config = function(plugin)
			require("config.orgmode")
		end,
	},

	-- Markdown utilities
	-- use(
	-- 	-- The ultimate markdown plugin
	-- 	{
	-- 		"plasticboy/vim-markdown",
	-- 		init = [[require('config.vim_markdown')]],
	-- 		dependencies = { "godlygeek/tabular" },
	-- 		ft = "markdown",
	-- 	}
	-- )

	-- Align characters <leader>a in V mode
	"godlygeek/tabular",
	-- Easier markdown table formatting
	{ "dhruvasagar/vim-table-mode", cmd = "TableModeToggle" },
	-- Automatically wrap lines when writing prose
	{ "preservim/vim-pencil", ft = { "markdown", "org", "tex" } },

	-- Format files on write
	{
		"mhartington/formatter.nvim",
		init = function()
			require("config.formatter_setup")
		end,
		config = function(plugin)
			require("config.formatter")
		end,
		cmd = "FormatWrite",
	},

	--- *** END ESSENTIALS *** ---

	--- *** BEGIN NICE-TO-HAVES *** ---

	-- UNIX commands within vim
	{
		"tpope/vim-eunuch",
		cmd = {
			"Delete",
			"Unlink",
			"Move",
			"Rename",
			"Chmod",
			"Mkdir",
			"Cfind",
			"Clocate",
			"Lfind",
			"SudoWrite",
			"SudoEdit",
			"Wall",
		},
	},

	-- Defines two mappings that make simple find and replace easier
	{ dir = "nathom/easy-replace.nvim" },

	-- A *much* faster replacement for the filetype.vim runtime file
	-- Github Version:
	-- { "nathom/filetype.nvim"},
	-- As of 2/21/22, it is faster than the new filetype.lua file
	{
		dir = "~/filetype.nvim",
		config = function(plugin)
			require("config.filetype")
		end,
	},

	-- A faster python indent config
	-- Github Version:
	-- { "nathom/fast-python-indent"},
	{ dir = "~/fast-python-indent" },

	-- Profile startup time
	{ "tweekmonster/startuptime.vim", cmd = "StartupTime" },

	-- Switch between vim splits and tmux panes easily
	-- GitHub version:
	-- "nathom/tmux.nvim"
	{
		dir = "~/tmux.nvim",
		-- "nathom/tmux.nvim",
		config = function(plugin)
			require("config.tmux")
		end,
	},

	-- Automatically generate python docstrings
	{
		"heavenshell/vim-pydocstring",
		build = "make install",
		cmd = "Pydocstring",
	},

	-- ARM assembly syntax file
	"ARM9/arm-syntax-vim",

	-- Nice buffer quitting
	{ "mhinz/vim-sayonara", cmd = "Sayonara" },

	-- Improved quickfix window
	"kevinhwang91/nvim-bqf",

	--- *** END NICE-TO-HAVES *** ---

	--- *** BEGIN EXPERIMENTAL *** ---

	-- Automatically convert markdown to PDF on :write
	{ dir = "~/pandoc.nvim" },

	-- Paste images into markdown and org files from clipboard
	{ dir = "~/imagepaste.nvim" },

	-- Speeds up startup
	"lewis6991/impatient.nvim",

	-- The Ultimate LaTeX plugin
	{
		"lervag/vimtex",
		config = function(plugin)
			require("config.vimtex")
		end,
	},

	-- Only compute folds on write
	-- {
	-- 	"Konfekt/FastFold",
	-- 	init = [[require("config.fastfold_setup")]],
	-- 	-- config = [[require("config.fastfold")]],
	-- 	-- keys = { { "n", "z" } },
	-- },

	{
		"kevinhwang91/nvim-ufo",
		config = function(plugin)
			require("config.ufo")
		end,
		dependencies = { "kevinhwang91/promise-async", "neovim/nvim-lspconfig" },
	},

	{
		"otavioschwanck/cool-substitute.nvim",
		config = function(plugin)
			require("config.cool")
		end,
	},

	{ dir = "~/diffstatus.nvim" },

	"stevearc/vim-arduino",
}
