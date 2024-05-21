-- Fix commonly misspelled words
return {
	dir = "~/vim-autocorrect",
	ft = { "markdown" },
	config = function()
		require("autocorrect").Autocorrect()
	end,
}
