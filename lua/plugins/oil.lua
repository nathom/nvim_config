return {
	"stevearc/oil.nvim",
	opts = {},
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
		})
	end,
	keys = { { "-", "<CMD>Oil<CR>", mode = { "n" }, desc = "Open parent directory" } },
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
