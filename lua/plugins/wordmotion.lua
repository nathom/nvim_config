-- Redefines the `w` object to make underscores and capital
-- letters delimiters
return {
	"chaoren/vim-wordmotion",
	keys = {
		{ "n", "w" },
		{ "n", "b" },
		{ "n", "W" },
		{ "n", "B" },
		{ "o", "w" },
		{ "o", "W" },
	},
}
