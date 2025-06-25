local auto = vim.api.nvim_create_autocmd

-- Autocomplete words from dictionary
-- auto({ "BufEnter" }, {
-- 	pattern = { "*.md", "*.tex" },
-- 	callback = function()
-- 		opt("dictionary", "/usr/share/dict/words")
-- 		opt("complete", vim.o.complete .. ",k")
-- 	end,
-- })

-- auto("BufWritePre", { pattern = { "*.md" }, command = "%s/\\s\\+$//e" })
auto({ "BufEnter", "BufNewFile" }, {
	pattern = { "*.g4" },
	callback = function()
		vim.bo.filetype = "antlr4"
		vim.bo.commentstring = [[// %s]]
	end,
})
