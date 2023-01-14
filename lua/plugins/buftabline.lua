return {
	"jose-elias-alvarez/buftabline.nvim",
	event = "BufAdd",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function(plugin)
		local sethl = require("config.utils").sethl

		local tabline_colors = { "#d3869b", "#ebdbb2" }
		local tabline_bg = "#282828"

		sethl("TabLineSel", tabline_colors[1], tabline_bg)
		sethl("TabLine", tabline_colors[2], tabline_bg)

		require("buftabline").setup({
			tab_format = " #{n}: #{b}#{f} #{i} ",
			auto_hide = true,
			go_to_maps = true,
		})
	end,
}
