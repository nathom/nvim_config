local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

-- parser_configs.norg = {
--     install_info = {
--         url = "https://github.com/nvim-neorg/tree-sitter-norg",
--         files = { "src/parser.c", "src/scanner.cc" },
--         branch = "main",
--     },
-- }

-- Haskell doesn't work without this
require("nvim-treesitter.configs").compilers = { "gcc-11" }

-- parser_configs.org = {
-- 	install_info = {
-- 		url = "https://github.com/milisims/tree-sitter-org",
-- 		-- revision = "f110024d539e676f25b72b7c80b0fd43c34264ef",
-- 		files = { "src/parser.c", "src/scanner.cc" },
-- 	},
-- 	filetype = "org",
-- }

require('orgmode').setup_ts_grammar()
require("nvim-treesitter.configs").setup({
	-- ensure_installed = { "lua", "python", "rust", "toml", "org", "c", "go" },
	highlight = {
		enable = true,
		disable = { "markdown", "org" },
		additional_vim_regex_highlighting = { "org" },
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]]"] = "@function.outer",
					-- ["]]"] = "@class.outer",
				},
				-- goto_next_end = {
				-- 	["]M"] = "@function.outer",
				-- 	-- ["]["] = "@class.outer",
				-- },
				goto_previous_start = {
					["[["] = "@function.outer",
					-- ["[["] = "@class.outer",
				},
				-- goto_previous_end = {
				-- 	["[M"] = "@function.outer",
				-- 	-- ["[]"] = "@class.outer",
				-- },
			},
			-- swap = {
			-- 	enable = true,
			-- 	swap_next = {
			-- 		["<leader>a"] = "@parameter.inner",
			-- 	},
			-- 	swap_previous = {
			-- 		["<leader>A"] = "@parameter.inner",
			-- 	},
			-- },
		},
	},
	ensure_installed = { "org" },
})

-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
