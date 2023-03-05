-- Text editing
-- Creates new text objects, such as `ia`, which will select
-- inside an argument in a function call
return {
	"wellle/targets.vim",
	keys = {
		{ "i", mode = "o" },
		{ "a", mode = "o" },
		{ "I", mode = "o" },
		{ "A", mode = "o" },
	},
}
