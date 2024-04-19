return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"css",
			"javascript",
			"html",
		})
	end,
	ft = { "css", "javascript", "html" },
}
