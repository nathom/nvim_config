return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required by telescope
		"MunifTanjim/nui.nvim",

		-- optional
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		injector = { ---@type table<lc.lang, lc.inject>
			["python3"] = {
				before = true,
			},
			["cpp"] = {
				before = { "#include <bits/stdc++.h>", "using namespace std;" },
				after = "int main() {}",
			},
			["java"] = {
				before = "import java.util.*;",
			},
		},
		lang = "python3",
		-- configuration goes here
	},
	enabled = true,
}
