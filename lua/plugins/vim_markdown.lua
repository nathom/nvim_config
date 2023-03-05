return {
	"plasticboy/vim-markdown",
	init = function()
		vim.g.vim_markdown_math = 1
	end,
	dependencies = { "godlygeek/tabular" },
	ft = "markdown",
	enabled = false,
}
