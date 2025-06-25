-- Fix commonly misspelled words
return {
	"nathom/autocorrect.nvim",
	ft = { "markdown" },
	config = function()
		require("autocorrect").Autocorrect()
	end,
}
