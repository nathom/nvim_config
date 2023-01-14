-- A fancy commenting plugin. You should read the docs to see all
-- of its features
return {
	"numToStr/Comment.nvim",
	config = function(plugin)
		require("Comment").setup()
	end,
}
