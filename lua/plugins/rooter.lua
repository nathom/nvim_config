-- Change cwd to the project root
-- Useful for fuzzy file finding
return {
	"airblade/vim-rooter",
	config = function(plugin)
		vim.g.rooter_patterns = { ".git" }
		vim.g.rooter_change_directory_for_non_project_files = "current"
	end,
}
