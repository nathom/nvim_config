return require("packer").startup({
	function(use)
		--- *** BEGIN ESSENTIALS *** ---

		-- Plugin manager
		use("wbthomason/packer.nvim")

		-- A faster port of the legendary gruvbox colorscheme
		-- use("lifepillar/vim-gruvbox8")
		use({ "ellisonleao/gruvbox.nvim" })

		-- Treesitter highlights
		-- Much more comprehensive and accurate than regex highlighting
		-- There may be performance issues on older laptops and with large
		-- source files
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			-- requires = { "nvim-treesitter/nvim-treesitter-textobjects" },
			-- commit = "a62971e0efcbe025693ccfaf688b62d185fd50da",
			config = [[require("config.treesitter")]],
		})

		-- A tabline that shows the current buffers
		use({
			"jose-elias-alvarez/buftabline.nvim",
			event = "BufAdd",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = [[require('config.buftabline')]],
		})

		-- Fuzzy finding and live grep
		-- This is slower than FZF.vim, but is much more
		-- extensible and ergonomic to use
		use({
			{
				"nvim-telescope/telescope.nvim",
				requires = {
					"nvim-lua/popup.nvim",
					"nvim-lua/plenary.nvim",
					-- "telescope-frecency.nvim",
					"kyazdani42/nvim-web-devicons",
				},
				setup = [[require('config.telescope_setup')]],
				config = [[require('config.telescope')]],
				cmd = "Telescope",
				module = "telescope",
			},
			-- Improve the fuzzy finding speed a bit
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		})

		-- Fast statusline
		-- Doesn't erase the startup screen like lualine does
		use({
			"famiu/feline.nvim",
			config = [[require('config.feline')]],
			requires = { "itchyny/vim-gitbranch" },
			disable = false,
		})

		-- Gutter signs that show changes to the current file
		-- Also provides an api that is used by my statusline
		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = [[require('config.gitsigns')]],
			disable = true,
		})

		-- This section encompasses everything LSP related
		use({
			-- Easier configuration for LSP clients
			{
				"neovim/nvim-lspconfig",
				config = [[require('config.lsp')]],
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
				config = [[require('config.trouble')]],
			},
		})

		-- Clears clutter from the screen for a more peaceful Neovim
		-- Less glitchy than Goyo.vim, especially with the bufferline
		use({
			"Pocco81/TrueZen.nvim",
			config = [[require('config.truezen')]],
			cmd = "TZAtaraxis",
		})

		-- Automatically set tab settings based on the contents of the file
		use("tpope/vim-sleuth")

		-- A fancy commenting plugin. You should read the docs to see all
		-- of its features
		use({
			"numToStr/Comment.nvim",
			config = [[require("config.comment")]],
		})

		-- Text editing
		use({
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
				keys = { "w", "b" },
			},
			-- Easily surround text in characters
			{
				"tpope/vim-surround",
			},
			-- Complete pair-type characters
			{
				"windwp/nvim-autopairs",
				config = [[require("config.autopairs")]],
				event = "InsertEnter",
			},
		})

		-- Stop highlighting after searching for text
		use({
			"romainl/vim-cool",
			keys = { { "n", "/" }, { "n", "?" }, { "n", "*" }, { "n", "#" } },
		})

		-- Fast replacement for NETRW
		use({ "justinmk/vim-dirvish", keys = { { "n", "-" } } })

		-- Change cwd to the project root
		-- Useful for fuzzy file finding
		use({ "airblade/vim-rooter", config = [[require("config.rooter")]] })

		-- Org-mode for neovim
		use({
			-- "~/orgmode",
			"kristijanhusak/orgmode.nvim",
			config = [[require("config.orgmode")]],
		})

		-- Markdown utilities
		-- use(
		-- 	-- The ultimate markdown plugin
		-- 	{
		-- 		"plasticboy/vim-markdown",
		-- 		setup = [[require('config.vim_markdown')]],
		-- 		requires = { "godlygeek/tabular" },
		-- 		ft = "markdown",
		-- 	}
		-- )

		-- Easier markdown table formatting
		use({ "dhruvasagar/vim-table-mode", cmd = "TableModeToggle" })
		-- Automatically wrap lines when writing prose
		use({ "preservim/vim-pencil", ft = { "markdown", "org", "tex" } })

		-- Format files on write
		use({
			"mhartington/formatter.nvim",
			setup = [[require('config.formatter_setup')]],
			config = [[require("config.formatter")]],
			cmd = "FormatWrite",
		})

		--- *** END ESSENTIALS *** ---

		--- *** BEGIN NICE-TO-HAVES *** ---

		-- UNIX commands within vim
		use({
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
		})

		-- Defines two mappings that make simple find and replace easier
		use("nathom/easy-replace.nvim")

		-- A *much* faster replacement for the filetype.vim runtime file
		-- Github Version:
		-- use({ "nathom/filetype.nvim"})
		-- As of 2/21/22, it is faster than the new filetype.lua file
		use({
			"~/filetype.nvim",
			config = [[require('config.filetype')]],
		})

		-- A faster python indent config
		-- Github Version:
		-- use({ "nathom/fast-python-indent"})
		use("~/fast-python-indent")

		-- Profile startup time
		use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })

		-- Switch between vim splits and tmux panes easily
		-- GitHub version:
		-- use("nathom/tmux.nvim")
		use({
			"~/tmux.nvim",
			-- "nathom/tmux.nvim",
			config = [[require("config.tmux")]],
		})

		-- Automatically generate python docstrings
		use({
			"heavenshell/vim-pydocstring",
			run = "make install",
			cmd = "Pydocstring",
		})

		-- ARM assembly syntax file
		use("ARM9/arm-syntax-vim")

		-- Nice buffer quitting
		use({ "mhinz/vim-sayonara", cmd = "Sayonara" })

		-- Improved quickfix window
		use("kevinhwang91/nvim-bqf")

		--- *** END NICE-TO-HAVES *** ---

		--- *** BEGIN EXPERIMENTAL *** ---

		-- Automatically convert markdown to PDF on :write
		use("~/pandoc.nvim")

		-- Paste images into markdown and org files from clipboard
		use("~/imagepaste.nvim")

		-- Speeds up startup
		use("lewis6991/impatient.nvim")

		-- The Ultimate LaTeX plugin
		use({ "lervag/vimtex", config = [[require('config.vimtex')]] })

		-- Only compute folds on write
		-- use({
		-- 	"Konfekt/FastFold",
		-- 	setup = [[require("config.fastfold_setup")]],
		-- 	-- config = [[require("config.fastfold")]],
		-- 	-- keys = { { "n", "z" } },
		-- })

		use({ "kevinhwang91/nvim-ufo", config = [[require('config.ufo')]], requires = "kevinhwang91/promise-async" })

		use("~/diffstatus.nvim")
		-- use({
		-- 	"AckslD/nvim-neoclip.lua",
		-- 	requires = {
		-- 		{ "tami5/sqlite.lua", module = "sqlite" },
		-- 	},
		-- 	config = [[require('config.neoclip')]],
		-- })
		--- *** END EXPERIMENTAL *** ---
	end,
	config = {
		-- Move packer_compiled lua dir so impatient.nvim can cache it
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
})
