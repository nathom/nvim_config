-- Automatically wrap lines when writing prose
return {
	"preservim/vim-pencil",
	init = function()
		vim.g["pencil#textwidth"] = 65
	end,
	ft = { "markdown", "org", "tex" },
	cmd = { "Pencil", "PencilHard", "PencilSoft", "PencilToggle" },
}
