-- Org-mode for neovim
return {
	-- "~/orgmode",
	"kristijanhusak/orgmode.nvim",
	config = function(plugin)
		-- Remove the ^-Space mapping from System Prefences->Shortcuts->Input Sources!
		--
		local HOME = require("config.utils").HOME

		require("orgmode").setup({
			org_agenda_files = {
				HOME .. "/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/*",
			},
			notifications = {
				enabled = true,
			},
		})
	end,
}
