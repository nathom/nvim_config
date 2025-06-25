return {
	"iurimateus/luasnip-latex-snippets.nvim",
	-- "evesdropper/luasnip-latex-snippets.nvim",
	config = function()
		require("luasnip-latex-snippets").setup({
			use_treesitter = false,
			allow_on_markdown = true,
		})
		-- or setup({ use_treesitter = true })
		require("luasnip").config.setup({ enable_autosnippets = true })
	end,
	requires = { "L3MON4D3/LuaSnip" },
	ft = "tex",
	after = "LuaSnip",
	enabled = true,
}
