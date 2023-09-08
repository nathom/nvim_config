return {
	dir = "~/vim-autocorrect",
	-- "panozzaj/vim-autocorrect",
	ft = { "markdown" },
	config = function()
		require("autocorrect").Autocorrect()
	end,
}
