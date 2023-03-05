-- Redefines the `w` object to make underscores and capital
-- letters delimiters
return {
	"chaoren/vim-wordmotion",
	keys = {
		{ "w", mode = "n" },
		{ "b", mode = "n" },
		{ "W", mode = "n" },
		{ "B", mode = "n" },
		{ "w", mode = "o" },
		{ "W", mode = "o" },
	},
}
