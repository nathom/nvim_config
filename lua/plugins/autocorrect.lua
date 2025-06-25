-- Fix commonly misspelled words
return {
	dir = "nathom/autocorrect.nvim",
	ft = { "markdown" },
	config = function()
		require("autocorrect").Autocorrect()
	end,
}
