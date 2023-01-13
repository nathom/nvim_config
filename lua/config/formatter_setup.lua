local extensions = {
	"c",
	"cpp",
	"go",
	"h",
	"hpp",
	"hs",
	"ino",
	"java",
	"js",
	"json",
	"lua",
	"md",
	"py",
	"rs",
	"tex",
}

local extension_str = "*." .. table.concat(extensions, ",*.")

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost ]] .. extension_str .. [[ FormatWrite
augroup END
]], true)
