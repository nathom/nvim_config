-- Instead of cluttering up the screen with error messages,
-- show them in a pretty window when requested
return {
	"folke/trouble.nvim",
	cmd = "TroubleToggle",
	config = function(plugin)
		require("trouble").setup({
			-- position = "right",
		})
	end,
}
