local extensions = {
    "c",
    "json",
    "lua",
    "py",
    "rs",
    "js",
    "cpp",
    "h",
    "hpp",
    "go",
}

local extension_str = "*." .. table.concat(extensions, ",*.")

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost ]] .. extension_str .. [[ FormatWrite
augroup END
]], true)
