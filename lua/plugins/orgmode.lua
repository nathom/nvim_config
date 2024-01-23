-- Org-mode for neovim
local HOME = require("utils").HOME
local org_path = HOME .. "/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org"

return {
	-- "~/orgmode",
	"kristijanhusak/orgmode.nvim",
	config = function(plugin)
		-- Remove the ^-Space mapping from System Prefences->Shortcuts->Input Sources!
		--
		require("orgmode").setup({
			org_agenda_files = {
				org_path .. "/*",
			},
			org_default_notes_file = org_path .. "/inbox.org",
			notifications = {
				enabled = true,
			},
		})
		require("orgmode").setup_ts_grammar()
	end,
	priority = 10,
	keys = { { "<Leader>oa", [[<cmd>lua require("orgmode").action("agenda.prompt")<CR>]], mode = "n" } },
	ft = { "org" },
	disabled = true,
}
