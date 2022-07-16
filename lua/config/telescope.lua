local telescope = require("telescope")
telescope.setup({
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
})

telescope.load_extension("fzf")
-- telescope.load_extension("neoclip")
