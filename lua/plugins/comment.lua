-- A fancy commenting plugin. You should read the docs to see all
-- of its features
local auto = vim.api.nvim_create_autocmd
local opt = require("utils").opt
return {
	"numToStr/Comment.nvim",
	config = function(plugin)
		auto({ "FileType" }, {
			pattern = { "systemverilog" },
			callback = function()
				opt("commentstring", "// %s")
			end,
		})
		require("Comment").setup()
	end,
}
