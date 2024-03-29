local auto = vim.api.nvim_create_autocmd
local opt = require("utils").opt

auto({ "BufEnter" }, {
	pattern = { "*.md", "*.tex" },
	callback = function()
		opt("dictionary", "/usr/share/dict/words")
		opt("complete", vim.o.complete .. ",k")
	end,
})

-- auto("BufWritePre", { pattern = { "*.md" }, command = "%s/\\s\\+$//e" })
