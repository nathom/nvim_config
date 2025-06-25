-- Fuzzy finding and live grep
-- This is slower than FZF.vim, but is much more
-- extensible and ergonomic to use
-- Improve the fuzzy finding speed a bit
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		-- "telescope-frecency.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		-- "nvim-telescope/telescope-ui-select.nvim",
	},
	init = function()
		local utils = require("utils")
		local map = utils.map
		local is_in_repo = utils.is_in_repo

		local silent = { silent = true }

		local in_repo = nil
		local function run_telescope_command()
			if in_repo == nil then
				in_repo = is_in_repo()
			end
			if in_repo then
				vim.cmd("Telescope git_files")
			else
				vim.cmd("Telescope find_files")
			end
		end
		map("n", "<C-p>", run_telescope_command, silent)
		map("n", "<C-g>", [[<cmd>Telescope live_grep<cr>]], silent)
		map("n", "<leader>H", [[<cmd>Telescope help_tags<cr>]], silent)
	end,
	opts = {
		defaults = {
			scroll_strategy = "cycle",
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				-- "-g '!.git'",
			},
		},

		pickers = {
			find_files = {
				theme = "dropdown",
				-- uses .ignore file in home dir
				find_command = { "rg", "--files", "--hidden" },
			},
			git_files = {
				theme = "dropdown",
			},
			live_grep = {
				theme = "dropdown",
			},
		},

		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = false, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)

		telescope.load_extension("fzf")
		-- telescope.load_extension("ui-select")
		-- telescope.load_extension("neoclip")
	end,
	cmd = "Telescope",
	module = "telescope",
}
