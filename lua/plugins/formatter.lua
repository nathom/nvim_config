local function ormolu()
	return {
		exe = "ormolu",
		stdin = true,
	}
end

local function prettier()
	return {
		exe = "prettier",
		args = {
			"--stdin-filepath",
			vim.api.nvim_buf_get_name(0),
			"--single-quote",
		},
		stdin = true,
	}
end

function clangformat()
	local fn = vim.api.nvim_buf_get_name(0):gsub(".*/", "")
	return {
		exe = "clang-format",
		args = { "--assume-filename", fn },
		stdin = true,
		cwd = vim.fn.expand("%:p:h"), -- Run clang-format in parent directory of file
	}
end

local function rustfmt()
	return {
		exe = "rustfmt",
		args = { "--emit=stdout", "--edition=2021" },
		cwd = vim.fn.expand("%:p:h"),
		stdin = true,
	}
end

local function black()
	return {
		exe = "black",
		args = { "--fast" },
		stdin = false,
	}
end

local function google_java_format()
	return {
		exe = "google-java-format",
		args = { "-" },
		stdin = true,
	}
end

local function isort()
	return { exe = "isort", args = { "-", "--quiet" }, stdin = true }
end

local function gofmt()
	return { exe = "gofmt", stdin = true }
end

local function stylua()
	return {
		exe = "stylua",
		args = {
			"--search-parent-directories",
			"-",
		},
		stdin = true,
	}
end

local function latexindent()
	return {
		exe = "latexindent",
		-- args = { [[--yaml="defaultIndent=' '"]] },
		stdin = true,
	}
end

local function fold()
	return {
		exe = "fold",
		args = { "-s" },
		stdin = true,
	}
end
-- local function cmake_format()
--   return { exe = 'cmake-format', args = { vim.fn.expand '%:t' }, stdin = false }
-- end

-- Format files on write
return {
	"mhartington/formatter.nvim",
	init = function()
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
	end,
	config = function(plugin)
		local formatter_setup = {
			logging = false,
			filetype = {
				-- cmake = { cmake_format },
				-- html = { prettier },
				arduino = { clangformat },
				c = { clangformat },
				cpp = { clangformat },
				go = { gofmt },
				haskell = { ormolu },
				java = { clangformat },
				javascript = { prettier },
				json = { prettier },
				lua = { stylua },
				markdown = { fold },
				python = { isort, black },
				rust = { rustfmt },
				tex = { latexindent },
			},
		}

		require("formatter").setup(formatter_setup)
	end,
	cmd = "FormatWrite",
}
