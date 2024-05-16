return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		--
		-- -- vim.keymap.set("n", "<C-u>", function()
		-- -- 	harpoon:list():select(1)
		-- -- end)
		-- vim.keymap.set("n", "<C-1>", function()
		-- 	harpoon:list():select(1)
		-- end)
		-- vim.keymap.set("n", "<C-2>", function()
		-- 	harpoon:list():select(2)
		-- end)
		-- vim.keymap.set("n", "<C-3>", function()
		-- 	harpoon:list():select(3)
		-- end)
		-- vim.keymap.set("n", "<C-4>", function()
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
	enabled = true,
}
