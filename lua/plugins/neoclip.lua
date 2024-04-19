-- clipboard history
return {
	"AckslD/nvim-neoclip.lua",
	requires = {
		-- you'll need at least one of these
		{ "kkharji/sqlite.lua", module = "sqlite" },
		{ "nvim-telescope/telescope.nvim" },
		-- {'ibhagwan/fzf-lua'},
	},
	config = function()
		require("neoclip").setup()
	end,
}
