-- The Ultimate LaTeX plugin
return {
	"lervag/vimtex",
	init = function()
		local opt = require("utils").opt
		vim.g.tex_flavor = "latex"
		vim.g.vimtex_view_method = "skim"
		vim.g.quickfix_mode = 0
		opt("conceallevel", 1)
		vim.g.tex_conceal = "abdmg"
	end,
	config = function(plugin)

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
