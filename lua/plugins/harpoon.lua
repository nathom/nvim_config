return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-telescope/telescope.nvim",
	},
	opts = {},
	config = function(_, opts)
		local harpoon = require("harpoon")

		-- REQUIRED
		-- vim.api.nvim_set_hl(0, "HarpoonWindow", { fg = "#fff000", bg = "#ff00ff" })
		-- vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "#ff0000", bg = "#000000" })
		-- vim.api.nvim_set_hl(0, "HarpoonTitle", { fg = "#ffffff", bg = "#40d9ff" })
		harpoon:setup(opts)
		-- REQUIRED

		-- vim.keymap.set("n", "<leader>a", function()
		-- 	harpoon:list():add()
		-- end)
		-- vim.keymap.set("n", "<C-e>", function()
		-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
		-- end)
		--
		-- -- vim.keymap.set("n", "<C-u>", function()
		-- -- 	harpoon:list():select(1)
		-- -- end)
		-- vim.keymap.set("n", "<C-y>", function()
		-- 	harpoon:list():select(1)
		-- end)
		-- vim.keymap.set("n", "<C-t>", function()
		-- 	harpoon:list():select(2)
		-- end)
		-- vim.keymap.set("n", "<C-n>", function()
		-- 	harpoon:list():select(3)
		-- end)
		-- vim.keymap.set("n", "<C-s>", function()
		-- 	harpoon:list():select(4)
		-- end)
		-- -- vim.keymap.set("n", "<C-s>", function()
		-- -- 	harpoon:list():select(4)
		-- -- end)
		-- --
		-- -- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set("n", "<C-[>", function()
		-- 	harpoon:list():prev()
		-- end)
		-- vim.keymap.set("n", "<C-]>", function()
		-- 	harpoon:list():next()
		-- end)
	end,
	-- Has an issue where pressing <ESC> jumps to a buffer in the list
	keys = {
		{
			"<leader>a",
			function()
				local harpoon = require("harpoon")
				harpoon:list():add()
			end,
			mode = "n",
		},
		{
			"<C-e>",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			mode = "n",
		},
		{
			"<C-i>",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(1)
			end,
			mode = "n",
		},
		{
			"<C-o>",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(2)
			end,
			mode = "n",
		},
		{
			"<C-w>",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(3)
			end,
			mode = "n",
		},
		{
			"<C-q>",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(4)
			end,
			mode = "n",
		},
		-- {
		-- 	"<C-[>",
		-- 	function()
		-- 		require("harpoon"):list():prev()
		-- 	end,
		-- 	mode = "n",
		-- },
		-- {
		-- 	"<C-]>",
		-- 	function()
		-- 		require("harpoon"):list():next()
		-- 	end,
		-- 	mode = "n",
		-- },
	},
	enabled = true,
}
