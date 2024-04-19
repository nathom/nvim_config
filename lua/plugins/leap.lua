-- Jump to any visible area in the page with `s{char}{char}`
return {
	"https://github.com/ggandor/leap.nvim",
	config = function()
		-- require("leap").create_default_mappings()
		vim.keymap.set({
			"n", --[[ "x", ]]
			"o",
		}, "s", "<Plug>(leap-forward)")
		vim.keymap.set({
			"n", --[[ "x", ]]
			"o",
		}, "S", "<Plug>(leap-backward)")
	end,
}
