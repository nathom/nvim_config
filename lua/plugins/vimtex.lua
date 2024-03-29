-- The Ultimate LaTeX plugin
return {
	"lervag/vimtex",
	config = function(plugin)
		map = require("utils").map

		vim.g.vimtex_view_method = "skim"

		map("n", "<leader>ba", "o\\begin{align*}<cr>\\end{align*}<esc>O", { silent = true })

		-- vim.g.vimtex_compiler_method = "generic"
		-- vim.g.vimtex_compiler_generic = {
		--     name = "generic",
		--     command = "pdflatex",
		--     continuous = false,
		-- }
		-- vim.cmd([[call vimtex#compiler#generic#init({'name': 'pdflatex', 'continuous': 0})]])
	end,
	ft = { "tex", "latex" },
}
