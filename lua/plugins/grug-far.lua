return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup({
			-- ... options, see Configuration section below ...
			-- ... there are no required options atm...
		})
	end,
	keys = { { "<Leader>g", [[:GrugFar<CR>]], mode = { "n" }, desc = "Open GrugFar" } },
}
