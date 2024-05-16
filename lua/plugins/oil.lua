return {
	"stevearc/oil.nvim",
	opts = {},
	config = function()
		require("oil").setup()
	end,
	keys = { { "-", "<CMD>Oil<CR>", mode = { "n" }, desc = "Open parent directory" } },
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
